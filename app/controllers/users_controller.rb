class UsersController < ApplicationController
  get '/login' do
    erb :'users/login'
  end
  
  post '/login' do
    user = User.create(params)
    #binding.pry
    redirect '/video-posts'
  end
end