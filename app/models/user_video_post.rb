class UserVideoPost < ActiveRecord::Base
  belongs_to :liker,
             :class_name => "User",
             :foreign_key => :user_id
  belongs_to :liked_video_post,
             :class_name => "VideoPost",
             :foreign_key => :video_post_id
end