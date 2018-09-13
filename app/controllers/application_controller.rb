require 'rack-flash'
# Main Controller for all routes
class ApplicationController < Sinatra::Base
  use Rack::Flash
  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'password_security'
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      session[:id] ? true : false
    end

    def current_user
      User.find_by_id(session[:id])
    end

    # def redirect_if_loggedin
    #   if logged_in?
    #     erb :'users/current_user'
    #   end
    # end
  end
end
