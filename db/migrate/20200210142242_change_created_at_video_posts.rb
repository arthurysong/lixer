class ChangeCreatedAtVideoPosts < ActiveRecord::Migration
    def change
      change_column_default :video_posts, :created_at, nil
    end
  end