class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :purchase_category

  validates :price, numericality: { greater_than:0 }
  validates :description, length: {in: 3..100 }

  self.per_page = 10

  def self.search(search, page)
  paginate :per_page => 5, :page => page,
           :conditions => ['description like ?', "%#{search}%"], :order => 'description'
           
  end
end
