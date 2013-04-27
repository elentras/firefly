class ApplicationController < ActionController::Base
  protect_from_forgery
  # check_authorization
  after_filter :store_location

  before_filter :load_messages

  def load_messages
    @messages = Message.all
    @message = Message.new
  end

  def store_location
   # store last url as long as it isn't a /users path
   session[:previous_url] = request.fullpath if not request.fullpath =~ /\/users/ and request.format != 'text/javascript'
  end

  def after_sign_in_path_for(resource)
   torrents_path
  end
end
