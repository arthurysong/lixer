class ApplicationController < Sinatra::Base
  enable :sessions
  set :session_secret, "my_application_secret"
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do 
    erb :index
  end
  
  
  
end