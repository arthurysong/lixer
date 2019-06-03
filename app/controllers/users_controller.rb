class UsersController < ApplicationController
 
  
  get '/login' do
    if logged_in?
      redirect '/video-posts'
    end
    erb :'users/login'
  end
  
  post '/login' do
    user = User.find_by(email: params["email"])
    #binding.pry
    
    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      redirect '/video-posts'
    end
    
    flash[:message] = "Invalid email and password combination"
    redirect '/login'
  end
  
  get '/signup' do
    erb :'users/signup'
  end
  
  post '/signup' do
    if params["username"] == "" || params["email"] == "" || params["password"] == ""
      redirect '/signup'
    end
    
    user = User.create(params)
    session[:user_id] = user.id
    
    redirect '/video-posts'
  end
  
  get '/logout' do
    if logged_in?
      session.clear
      
      redirect '/video-posts'
    end
  end
end