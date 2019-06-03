class VideoPostsController < ApplicationController
  get '/video-posts' do
    if logged_in? 
      @user = current_user
    end
    
    erb :'video_posts/video_posts'
  end
  
  get '/video-posts/new' do
    if logged_in?
      erb :'video_posts/new'
    else
      redirect '/login'
    end
  end
  
  post '/video-posts' do
    if params["title"] == "" || params["video_link"] == ""
      flash[:message] = "Please enter a title and video link."
      redirect '/video-posts/new'
    end
    
    user = current_user
    videopost = VideoPost.create(params)
    videopost.creator = user
    videopost.save
    redirect "/video-posts/#{videopost.id}"
  end
  
  
end