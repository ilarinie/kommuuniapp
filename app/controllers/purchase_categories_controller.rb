class PurchaseCategoriesController < ApplicationController
before_action :set_purchase_category, only: [:show, :edit, :update]
before_action :ensure_that_signed_in


def show
  @purchases = @purchase_category.purchases.paginate(:page => params[:page]).order(created_at: :desc)
  @categories = PurchaseCategory.all
  @users = User.active
end

def new
  @purchase_category = PurchaseCategory.new
end
def edit
end
def update
  if @purchase_category.update(purchase_category_params)
    redirect_to :back, notice: 'PurchaseCategory updated succesfully'
  else
    redirect_to :root, alert: 'Something went wrong'
  end
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
  @purchase_category = PurchaseCategory.find(params[:id])
end

def purchase_category_params
  params.require(:purchase_category).permit(:name)
end

end
