class UsersController < ApplicationController
  get '/login' do
    erb :'users/login'
  end
  
  post '/login' do
    
    redirect '/video-posts'
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
end