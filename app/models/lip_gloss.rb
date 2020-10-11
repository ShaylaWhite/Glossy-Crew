class LipGloss < ApplicationRecord
  belongs_to :sponsor
  belongs_to :user #
  has_many :reviews
  has_many :users, through: :reviews 
  accepts_nested_attributes_for :sponsor

  validates :name, presence: true
  validates :price, presence: true
  validate :already_exist



  scope :order_by_review, -> {left_joins(:reviews).group(:id).order("price desc")}




  def sponsor_attributes(attributes)
    sponsor = Sponsor.find_or_create_by(attributes) if !name.empty
  end 


  def already_exist
  if LipGloss.find_by(name: name,price: price) 
    errors.add(:name, 'has already been added for that price')
  end
end



 def name_of_sponsor #reader
    "#{name} - #{sponsor.name}"
   end


  

end
