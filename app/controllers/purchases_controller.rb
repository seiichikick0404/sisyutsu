class PurchasesController < ApplicationController
  def index
    @purchase = Purchase.new
  end

  def new
  end
end
