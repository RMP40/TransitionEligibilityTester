class UserController < ApplicationController
	def list
		@users = User.all
	end
	
	def show
		@user = User.find(params[:id])
	end
	
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		
		if @user.save
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
	end
	
	def edit
		@user = User.find(params[:id])
	end
	
	def update
		@user = User.find(params[:id])
		
		if @user.update_attrubutes(user_params)
			redirect_to :action => 'show', :id => @user
		else
			render :action => 'edit'
		end
	end
	
	def delete
		User.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
	
end

def user_params
	params.require(:users).permit(:name, :email, :password, :administrator)
end
	