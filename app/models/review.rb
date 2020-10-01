class Review < ApplicationRecord
  belongs_to :lip_gloss
  belongs_to :user

  validates :comment, presence: true { message: 'must leave a comment' }
end
