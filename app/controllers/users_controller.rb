class UsersController < ApplicationController

	def create
	  user = User.create(user_params)
	  if user.save
	  	puts "SAVED HERE"
        session[:user_id] = user.id
	    redirect_to user_path user
	  else
	    redirect_to users_path
	  end
	end

	def index

	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	private 

	def user_params
	  params.require(:user).permit(:name,:email, :password, :password_confirmation, :avatar)
	end


end
