class Reservation < ActiveRecord::Base
belongs_to :user
belongs_to :restaurant
validates :time, numericality: {only_integer: true, greater_than: 11, less_than: 22}
validates :party_size, numericality: {only_integer: true, greater_than: 2, less_than: 20}
end
