class User < ActiveRecord::Base
  has_secure_password
  
  has_many :created_video_posts,
           :class_name => "VideoPost",
           :foreign_key => :creator_id
           
  has_many :user_video_posts
  has_many :liked_video_posts, 
           :through => :user_video_posts,
           :source => :liked_video_post,
           :inverse_of => :likers
end