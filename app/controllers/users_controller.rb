class UsersController < ApplicationController

	def create
    # if params[:user][:password] == params[:user][:password_confirmation]  <== the pass and pass conf took care of this. 
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to "/bright_ideas"
      else
        flash[:errors] = @user.errors.full_messages
        redirect_to "/users/main"
      end
    
  end

  def show
  	@user = User.find(params[:id])
  	@idea = Idea.find(params[:id])	
  end


private
  def user_params
    params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
  end


end
