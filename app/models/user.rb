class User < ActiveRecord::Base
  has_secure_password
  
  has_many :created_video_posts,
           :class_name => "VideoPost",
           :foreign_key => :creator_id
end