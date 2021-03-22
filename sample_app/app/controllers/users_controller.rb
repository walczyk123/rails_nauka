class UsersController < ApplicationController
  def new
    #debugger
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
end
