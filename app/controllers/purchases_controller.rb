class PurchasesController < ApplicationController
  before_action :ensure_that_signed_in

  def new
    @purchase = Purchase.new
    @categories = PurchaseCategory.all.where.not(id:1)
  end

  def index
    @purchases = Purchase.paginate(:page => params[:page]).order(created_at: :desc)
    @categories = PurchaseCategory.all
    @users = User.active

  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user = current_user
    if @purchase.save
      TelegramApi.send_to_channel ""+current_user.to_s+ " has just bought "+@purchase.description+". Cost: "+@purchase.price.to_s+" €. Category: "+@purchase.purchase_category.to_s+""
      redirect_to :root, notice: 'Purchase saved'
    else
      @categories = PurchaseCategory.all.where.not(id:1)
      render :new
    end
  end


  private

  def purchase_params
    params.require(:purchase).permit(:purchase_category_id, :price, :description)
  end

end
