class ApplicationController < ActionController::Base
  include SessionsHelper
  def hello
    render html: "witaj w mojej karczmie"
  end
  # adding user to main page (experiment)
  # def show
  #   @user = User.find(params[:id])
  # end
  # private
  #   def user_params
  #     params.require(:user).permit(:name,:email,:password,:password_confirmation)
  #   end
end
