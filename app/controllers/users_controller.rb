class UsersController < ApplicationController
 
  
  get '/login' do
    if logged_in?
      redirect '/video-posts'
    end
    erb :'users/login'
  end
  
  post '/login' do
    user = User.find_by(email: params["email"])
    
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
      flash[:message] = "Please fill in all the forms"
      
      redirect '/signup'
    end
    
    if !User.find_by(username: params["username"]) && !User.find_by(email: params["email"])
      user = User.create(params)
      session[:user_id] = user.id
      
      redirect '/video-posts'
    else
      flash[:message] = "User with entered username or email already exists"
      
      redirect '/signup'
    end
  end
  
  get '/logout' do
    if logged_in?
      session.clear
      
      redirect '/video-posts'
    end
  end
end