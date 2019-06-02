class VideoPostsController < ApplicationController
  get '/video-posts' do 
    erb :'video_posts/video_posts'
  end
  
end