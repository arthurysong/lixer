require 'sinatra/base'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash
  enable :sessions
  set :session_secret, "my_application_secret"
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do 
    redirect '/video-posts'
  end
  
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
    
    def redirect_if_not_logged_in
      if !logged_in?
        redirect '/video-posts'
      end
    end
  end
  
end