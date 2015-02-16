class User < ActiveRecord::Base
	has_secure_password
	has_many :reservations
	has_many :reviews
	has_many :restaurants, through: :reviews 
end
