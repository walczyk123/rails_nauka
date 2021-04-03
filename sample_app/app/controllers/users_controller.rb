class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]

  def new
    #debugger
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to my inn"
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  def show_user
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your new data seams okay, move along"
      redirect_to user_url(@user)
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Put down your weapon, go away, you shouldn't be here"
      redirect_to login_url
    end
  end

end
