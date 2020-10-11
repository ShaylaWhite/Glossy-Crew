class Review < ApplicationRecord
  belongs_to :lip_gloss
  belongs_to :user
  

  validates :purchase, presence: true
  validates :comment, presence: true

  validates :lip_gloss, uniqueness: { scope: :user, message: "has already been reviewed by you"  }

   
end
