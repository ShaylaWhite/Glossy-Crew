class Review < ApplicationRecord
  belongs_to :lip_gloss
  belongs_to :user
  #join table 
   
  validates :purchase, presence: true
  validates :comment, presence: true

  validates :lip_gloss, uniqueness: { scope: :user, message: "has already been reviewed by you"  }

   
end

#many-to-many relationship is between lip_gloss and user w/ the has_many through