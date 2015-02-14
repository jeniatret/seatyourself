class UsersController < ApplicationController
	def index 
		@reservations = current_user.reservations
	end
	
	def new
		@user = User.new
	end
	
	def create
	 @user = User.new(user_params)
		
		if @user.save
		   redirect_to restaurants_path, notice: "Signed up!"
		else 
		    render :new
		end 
	end	

	def show
		@user = User.find(params[:id])
	end
	
	def edit 
		@user = User.find(params[:id])
	end
	
	def update
		@user = User.new(user_params)

		if @user.update_attributes(user_params)
			redirect_to user_path(@user)
		else
			render :edit
		end 
	end
	
	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to root_path
	end 

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation)
	end	
end
