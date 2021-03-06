class UserController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end
  

	def panel
		@user = User.find(params[:id])
		
		@programs = Progam.all
		
		@program = Program.new
		
		@program_requirements = ProgramRequirement.new
	
	end

  
  private
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
	
	