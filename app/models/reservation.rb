class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant
	validates :time, numericality: {only_integer: true, greater_than: 11, less_than: 22}
	validates :party_size, numericality: {only_integer: true, greater_than: 1, less_than: 21}
	validates :date, :user, presence: true
	validate :date_must_be_between, :date_cannot_be_in_the_past
	validate :availability
	
	private
	def date_must_be_between
		errors.add(:date, "is too far away. Only book one month ahead.") unless date < Date.today + 1.month
	end

	def date_cannot_be_in_the_past
		errors.add(:date, "cannot be in the past. Booking starts with today date.") unless date >= Date.today
	end 
	
	def availability 
		other_people = restaurant.reservations.where(time: time).sum(:party_size)

		if (other_people + party_size) > restaurant.capacity
			errors.add(:base, "Sorry, the restaurant is booked for this hour")
		end
	end

end
