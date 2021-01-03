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
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      redirect_to root_path
    end
  end


  private
  def purchase_params
    params.require(:purchase).permit(:text, :category_id,:price)
  end
end

