class RestaurantsController < ApplicationController
	def index 
		@restaurants = Restaurant.all
	end
	
	def new
		@restaurant = Restaurant.new
	end
	
	def create
	 @restaurant = Restaurant.new(restaurant_params)
		
		if @restaurant.save
		   redirect_to restaurants_url
		else 
		    render :new
		end 
	end	

	def show
		if params[:restaurant_id]
			# nested (/restaruants/:restaurant_id/reservations/:id)
			@restaurant = Restaurant.find(params[:restaurant_id])
			@reservation = @restaurant.reservations.find(params[:id])
		else
			# just /restaurant/:id
			@restaurant = Restaurant.find(params[:id])
			@reservation = Reservation.new
		end
		@review = Review.new
	end
	
	def edit 
		@restaurant = Restaurant.find(params[:id])
	end
	
	def update
		@restaurant = Restaurant.new(restaurant_params)

		if @restaurant.update_attributes(restaurant_params)
			redirect_to restaurant_path(@restaurant)
		else
			render :edit
		end 
	end
	
	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		redirect_to restaurants_path
	end 

	private
	def restaurant_params
		params.require(:restaurant).permit(:name, :summary, :phone, :address, :capacity)
	end
end
