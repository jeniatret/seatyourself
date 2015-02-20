class ReservationsController < ApplicationController
	before_filter :load_restaurant, :load_user
	before_filter :ensure_logged_in, only: [:create, :destroy]

	def index 
		@reservations = @model.reservations
	end
	
	def create
		 @reservation = Reservation.new(reservation_params)
		 @reservation.restaurant = @model
		 @reservation.user = current_user
		
		if @reservation.save
			redirect_to user_reservation_path(current_user, @reservation)
		else 
			@restaurant = @model
			@review = Review.new
			render 'restaurants/show'
		end 
	end	

	def show
		@reservation = Reservation.find(params[:id])
	end
	
	def edit 
		@reservation = Reservation.find(params[:id])
		@restaurant = @reservation.restaurant
		render "restaurants/show"
	end
	
	def update
		@reservation = Reservation.find(params[:id])

		if @reservation.update_attributes(reservation_params)
			flash[:notice] = "Reservation created!"
			redirect_to user_reservation_path(current_user, @reservation)
		else
			render "restaurants/show"
		end 
	end
	
	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to restaurants_path
	end 

	private
	def reservation_params
		params.require(:reservation).permit(:time, :date, :party_size)
	end

	# Skip loading model if <association>_id is missing
	# from params

	# Restaurant and User both share an association:
	# - reservations
	# so we can leverage that in our views by using
	# a generic model name.
	# model name could probably be improved
	# comments in source code are terrible
	def load_restaurant
		return unless params[:restaurant_id]
		@model = Restaurant.find(params[:restaurant_id]) 
	end

	def load_user
		return unless params[:user_id]
		@model = User.find(params[:user_id])
	end
end
