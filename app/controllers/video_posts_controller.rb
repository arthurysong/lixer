class VideoPostsController < ApplicationController
  get '/video-posts' do
    if logged_in? 
      @user = current_user
    end

    # binding.pry
    
    @videoposts = VideoPost.all
    erb :'video_posts/video_posts'
  end
  
  get '/video-posts/new' do
    redirect_if_not_logged_in
   
    erb :'video_posts/new'
  end
  
  post '/video-posts' do
    # binding.pry

    if params["title"] == "" || params["video"] == "" || params["video_link"] == ""
      flash[:message] = "Please enter a title, video file and video link."
      redirect '/video-posts/new'
    end
    
    # filename = params["video"]["filename"]
    # file = params["video"]["tempfile"]

    # File.open("./public/#{filename}", 'wb') do |f|
    #   f.write(file.read)
    # end

    videopost = VideoPost.create(params)
    videopost.creator = current_user
    videopost.created_at = DateTime.now
    videopost.save
    redirect "/video-posts/#{videopost.id}"
  end
  
    
  get '/video-posts/liked-video-posts' do
    redirect_if_not_logged_in
    
    @user = current_user
    erb :'video_posts/liked_video_posts'
  end
  
  get '/video-posts/created-video-posts' do
    redirect_if_not_logged_in
    
    @user = current_user
    erb :'video_posts/created_video_posts'
  end
  
  get '/video-posts/:id' do
    @videopost = VideoPost.find(params[:id])
    if logged_in?
      @liked_video_posts = current_user.liked_video_posts
    end
    # binding.pry
    
    erb :'video_posts/show'
  end
  
  delete '/video-posts/:id/delete' do
    current_user
    videopost = VideoPost.find(params[:id])
    
    if current_user != videopost.creator
      redirect '/video-posts'
    end
    
    current_user.created_video_posts.destroy(params[:id])
    current_user.save
    
    flash[:message] = "Successfully deleted video"
    redirect '/video-posts'
  end
  
  post '/video-posts/:id/like' do
    current_user
    videopost = VideoPost.find(params[:id])
    unliked = ""
    
    if current_user.liked_video_posts.include?(videopost)
      current_user.liked_video_posts.delete(videopost)
      unliked = "un"
    else
      current_user.liked_video_posts << videopost
    end

    current_user.save
    
    flash[:message] = "Successfully #{unliked}liked '#{videopost.title}'"
    redirect '/video-posts'
  end
  
  get '/video-posts/:id/edit' do
    @videopost = VideoPost.find(params[:id])
    if @videopost.creator != current_user
      redirect '/video-posts'
    end
    
    erb :'video_posts/edit'
  end
  
  patch '/video-posts/:id' do
    videopost = VideoPost.find(params[:id])
    if current_user != videopost.creator
      redirect "/video-posts"  
    end
    
    if params["title"] == ""
      flash[:message] = "Please fill in new title"
      
      redirect "/video-posts/#{params[:id]}/edit"
    else
      
      videopost.title = params["title"]
      videopost.save
      
      redirect "/video-posts/#{params[:id]}"
    end
  end

end