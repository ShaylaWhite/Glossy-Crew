class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_lip_glosses, through: :reviews, source: :lip_gloss
    has_many :lip_glosses
    has_secured_password
end
