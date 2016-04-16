class PurchaseCategory < ActiveRecord::Base
  has_many :purchases

  def to_s
    self.name
  end
end
