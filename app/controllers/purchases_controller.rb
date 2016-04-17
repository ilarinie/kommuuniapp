class PurchasesController < ApplicationController
  before_action :ensure_that_signed_in

  def new
    @purchase = Purchase.new
    @categories = PurchaseCategory.all.where.not(id:1)

  end

  def index
    @purchases = Purchase.paginate(:page => params[:page]).order(created_at: :desc)
    @categories = PurchaseCategory.all

  end

  def create
    @purchase = Purchase.new(purchase_params)
    if !@purchase.purchase_category_id==1 && @purchase.save
      current_user.purchases << @purchase
      redirect_to :root, notice: 'Purchase saved'
    else
      redirect_to :root, alert: 'Error creating purchase'
    end

  end


  private

  def purchase_params
    params.require(:purchase).permit(:purchase_category_id, :price, :description)
  end

end
