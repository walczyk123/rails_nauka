class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    #if user && user.authenticate(params[:session][:password])
    if user &.authenticate(params[:session][:password])
      log_in user
      remember user
      redirect_to user
    else
      # flash can persist to next page after rendered page
      #flash[:danger] = 'Invalid email and password combination'
      # flash.now renders only on newly rendered pages
      flash.now[:danger] = 'Invalid email and password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
