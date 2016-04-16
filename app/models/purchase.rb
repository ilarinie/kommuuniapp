class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :purchase_category

  self.per_page = 10
end
