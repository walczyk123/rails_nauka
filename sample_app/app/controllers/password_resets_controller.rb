class PasswordResetsController < ApplicationController
  # def initialize
  #   @email_sent_msg = "An email has been sent with a link to reset the password"
  #   @wrong_email_msg = "Email not found in database"
  # end

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
end
