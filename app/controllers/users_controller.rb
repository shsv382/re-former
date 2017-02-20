class UsersController < ApplicationController
	
	def index
	end

	def new
		@user = User.new
	end

	def create
#		@user = User.new(user_params)
@user = User.new(username: params[:username], email: params[:email], password: params[:password])
		if @user.save
			flash[:success]
			redirect_to root_path
		else
			flash.now[:error]
			render :new
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end

end
