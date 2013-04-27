class ApplicationController < ActionController::Base
  protect_from_forgery
  # check_authorization
  after_filter :store_location

  def store_location
   # store last url as long as it isn't a /users path
   session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/ and request.format == 'text/javascript'
   puts "request.format === #{ request.format != 'text/javascript' }"
  end

  def after_sign_in_path_for(resource)
   session[:previous_url] || torrents_path
  end
end
