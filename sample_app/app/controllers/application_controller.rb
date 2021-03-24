class ApplicationController < ActionController::Base
  include SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def hello
    render html: "witaj w mojej karczmie"
  end
end
