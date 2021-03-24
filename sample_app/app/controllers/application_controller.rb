class ApplicationController < ActionController::Base
  include SessionsHelper
  def hello
    render html: "witaj w mojej karczmie"
  end
end
