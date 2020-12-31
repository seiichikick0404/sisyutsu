class PurchasesController < ApplicationController
  def index
  end

  def new
    Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.save
  end


  private
  def purchase_params
    params.require(:purchase).permit(:text, :price, :category_id)
  end
end
