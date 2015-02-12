class ReservationsController < ApplicationController
	def index 
		@reservations = Reservation.all
	end
	
	def new
		@reservation = Reservation.new
	end
	
	def create
		 @reservation = Reservation.new(reservation_params)
		
		if @reservation.save
		    redirect_to reservations_url
		else 
			render :new
		end 
	end	

	def show
		@reservation = Reservation.find(params[:id])
	end
	
	def edit 
		@reservation = Reservation.find(params[:id])
	end
	
	def update
		@reservation = Reservation.new(reservation_params)

		if @reservation.update_attributes(reservation_params)
			redirect_to reservation_path(@reservation)
		else
			render :edit
		end 
	end
	
	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to reservations_path
	end 

	private
	def reservation_params
		params.require(:reservation).permit(:time, :date, :party_size)
	end
end
