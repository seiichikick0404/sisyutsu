class PurchasesController < ApplicationController
  def index
    query = "SELECT *
    FROM purchases
    WHERE created_at >= CURRENT_DATE"
    @result_today = Purchase.find_by_sql(query)   #今日の出費のデータ

    @purchases = Purchase.all 
    @purchase_week = 0
    this_week = Date.today.all_week # all_weekをDate.todayに適用すると、今週の年月日データを取得できる。
      @purchases.each do |purchase| 
        if (this_week.include?(Date.parse(purchase[:created_at].to_s)))
            @purchase_week += purchase[:price] 
        end
      end
    
    @purchase_month = 0
    this_month = Date.today.all_month # all_monthをDate.todayに適用すると、今月の年月日データを取得できる。
      @purchases.each do |purchase| 
        if (this_month.include?(Date.parse(purchase[:created_at].to_s)))
          @purchase_month += purchase[:price]
        end
      end
    
      @balance_money = 200000 - @purchase_month   #給与の残額を取得

    # １ヶ月の自己投資学の取得
    investment_money = "SELECT * FROM purchases WHERE category_id = 9"
    @investments = Purchase.find_by_sql(investment_money)
    @investments_total = 0
    @investments.each do |investment|
      if (this_month.include?(Date.parse(investment[:created_at].to_s)))
        @investments_total += investment[:price]
      end
    end

    # １ヶ月の無駄遣い費の取得
    waste_money = "SELECT * FROM purchases WHERE category_id = 11"
    @wastes = Purchase.find_by_sql(waste_money)
    @wastes_total = 0
    @wastes.each do |waste|
      if (this_month.include?(Date.parse(waste[:created_at].to_s)))
        @wastes_total += waste[:price]
      end
    end

  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      redirect_to root_path
    else 
      render action: new
    end
  end


  private
  def purchase_params
    params.require(:purchase).permit(:text, :category_id,:price)
  end
end

