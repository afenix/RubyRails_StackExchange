class UsersController < ApplicationController

  def index
    @users = User.all
    @questions = Question.all
    @answers = Answer.all
    @user = current_user
  end

  def new
   @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User has been added!"
      redirect_to users_path
    else
      flash[:alert] = "There was a problem, yo."
      redirect_to users_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end



  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
