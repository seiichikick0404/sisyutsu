class PurchasesController < ApplicationController
  def index
    query = "SELECT *
    FROM purchases
    WHERE created_at >= CURRENT_DATE"
    @result_today = Purchase.find_by_sql(query)
    
    
    @result_today.each do |result| 
      result.price
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

