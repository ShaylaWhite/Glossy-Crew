class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_lip_glosses, through: :reviews, source: :lip_gloss
    has_many :lip_glosses
    has_secure_password

    validates :username, uniqueness:true, presence:true 
    validates :password, length: { in: 6..100 }
    

    def self.create_google_omniauth(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |u|
          u.password = SecureRandom.hex
        end
      end
end
