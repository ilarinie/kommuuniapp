class PurchasesController < ApplicationController
  before_action :ensure_that_signed_in

  def new
    @purchase = Purchase.new
    @categories = PurchaseCategory.all
  end

  def index
    @purchases = Purchase.paginate(:page => params[:page]).order(created_at: :desc)
    @categories = PurchaseCategory.all
  end

  def create
  

  end

end
