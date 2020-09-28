class User < ApplicationRecord
    has_many :reviews
    has_many :lip_glosses, through :reviews  
end
