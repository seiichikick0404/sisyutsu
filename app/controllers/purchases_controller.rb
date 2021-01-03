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

