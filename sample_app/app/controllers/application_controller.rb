class ApplicationController < ActionController::Base
  def hello
    render html: "witaj w mojej karczmie"
  end
end
