require_relative '../uploaders/video_uploader'

# require 'carrierwave/orm/activerecord'

class VideoPost < ActiveRecord::Base
  belongs_to :creator, 
             :class_name => "User", 
             :foreign_key => :creator_id
             
  has_many :user_video_posts
  has_many :likers, 
           :through => :user_video_posts,
           :source => :liker,
           :inverse_of => :liked_video_posts

  mount_uploader :video, VideoUploader
end