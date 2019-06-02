class CreateUserVideoPosts < ActiveRecord::Migration
  def change
    create_table :user_video_posts do |t|
      t.integer :user_id
      t.integer :video_post_id
    end
  end
end
