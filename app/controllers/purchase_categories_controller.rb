class PurchaseCategoriesController < ApplicationController
before_action :set_purchase_category, only: [:show]


def show
  @purchases = @category.purchases.paginate(:page => params[:page]).order(created_at: :desc)
  @categories = PurchaseCategory.all
end

private

def set_purchase_category
  @category = PurchaseCategory.find(params[:id])

end

end
