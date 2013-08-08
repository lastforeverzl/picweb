class UsersController < ApplicationController

	before_filter :signed_in_user, only:[:index,:edit,:update]
	before_filter :correct_user,   only: [:edit, :update]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show 
		@user = User.find(params[:id])
	end

	def create
    	@user = User.new(params[:user])
    	if @user.save
      		# Handle a successful save.
      		sign_in @user
      		flash[:success] = "signup successful!"
      		redirect_to @user
    	else
			render('new')
    	end
  	end

  	def edit
  		# @user = User.find(params[:id])
  	end

  	def update
	    # @user = User.find(params[:id])
	    if @user.update_attributes(params[:user])
	    	flash[:success] = "Profile updated"
	      	sign_in @user
	      	redirect_to @user
	    else
	      	render 'edit'
	    end
  	end

end
