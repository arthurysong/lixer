class VideoPostsController < ApplicationController
  get '/video-posts' do
    if logged_in? 
      @user = current_user
    end
    
    erb :'video_posts/video_posts'
  end
  
  get '/video-posts/new' do
    if logged_in?
      erb :'video-posts/new'
    else
      redirect '/login'
    end
  end
end