class User < ActiveRecord::Base

    has_secure_password
    has_many :reviews
    validates :name, :email, :password, :password_confirmation, presence: true
    validates :email, uniqueness: true

end