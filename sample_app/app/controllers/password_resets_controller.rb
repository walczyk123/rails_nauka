class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit,:update]
  before_action :valid_user, only: [:edit,:update]

  def new
  end

  def edit
  end

  def create
    email_sent_msg = "An email has been sent with a link to reset the password"
    wrong_email_msg = "Email not found in database"
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info]  = email_sent_msg
      redirect_to root_url
    else
      flash.now[:danger] = wrong_email_msg
      render "new"
    end
  end

  #================== private ===================
  private
  def get_user
    @user = User.find_by(email: params[:email])
  end

  def valid_user
    unless @user && @user.activated? && @user.authenticated?(:reset, params[:id])
      redirect_to root_url
    end
  end
end
