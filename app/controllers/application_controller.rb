class ApplicationController < ActionController::Base
  include Response
  include ExceptionHandler
  # before_action :get_request

  # private

  # def get_request
  #   puts request.headers.each { |req| puts req }
  # end
end
