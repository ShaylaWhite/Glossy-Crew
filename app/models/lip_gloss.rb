class LipGloss < ApplicationRecord
  belongs_to :sponsor
  belongs_to :user #
  has_many :reviews
  has_many :users, through: :reviews 
end
