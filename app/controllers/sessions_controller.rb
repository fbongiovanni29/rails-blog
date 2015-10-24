class SessionsController < ApplicationController
def new
end

def create
	puts params
	user = User.find_by(email: params[:email])

	puts "PRINTING USER"
	puts user
	if user && user.authenticate(params[:password])
		session[:user_id] = user.id
		redirect_to '/'
	else

	  redirect_to '/login'
	end			   
end

def destroy
  session[:user_id] = nil
  redirect_to '/login'
end


end
