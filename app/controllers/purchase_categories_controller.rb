class PurchaseCategoriesController < ApplicationController
before_action :set_purchase_category, only: [:show]
before_action :ensure_that_signed_in


def show
  @purchases = @category.purchases.paginate(:page => params[:page]).order(created_at: :desc)
  @categories = PurchaseCategory.all
  @users = User.active
end

def new
  @purchase_category = PurchaseCategory.new
end

def create
  @cat = PurchaseCategory.new(purchase_category_params)
  if @cat.save
    redirect_to :root, notice: 'New purchase category added.'
  else
    render :new
  end
end

private

def set_purchase_category
  @category = PurchaseCategory.find(params[:id])
end

def purchase_category_params
  params.require(:purchase_category).permit(:name)
end

end
