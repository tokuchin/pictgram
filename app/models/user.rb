class User < ApplicationRecord
    validates :name, presence: true
    validates :name, length: { maximum: 15 }
    
    validates :email, presence: true
    validates :password, length: { minimum: 6,  maximum: 32 }
    validates :email, format: { with:/\A.+@.+[.].+\z/i  }
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password, format: { with: VALID_PASSWORD_REGEX }
    
    has_secure_password

end
