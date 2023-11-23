class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 15 }
    validates :email, presence: true, format: { with:/\A.+@.+[.].+\z/i  }

    validates :password, length: { minimum: 6,  maximum: 32 }
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password, format: { with: VALID_PASSWORD_REGEX }
    
    has_secure_password

end
