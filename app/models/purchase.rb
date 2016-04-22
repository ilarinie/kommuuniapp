class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :purchase_category

  validates :user_id, presence: true
  validates :price, numericality: { greater_than:0 }
  validates :description, length: {in: 3..100 }

  self.per_page = 10
end
