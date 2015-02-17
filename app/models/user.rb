class User < ActiveRecord::Base
	has_secure_password
	has_many :reservations
	has_many :reviews
	has_many :restaurants, through: :reviews 
	validates :email, uniqueness: true
	validates :password, confirmation: true
	validates :password_confirmation, presence: true
	validates :password, length: {in: 4..20}
end
