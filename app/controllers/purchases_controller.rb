class PurchasesController < ApplicationController
  def index

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

