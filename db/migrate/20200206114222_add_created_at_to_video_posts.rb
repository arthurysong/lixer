class AddCreatedAtToVideoPosts < ActiveRecord::Migration
    def change
      add_column :video_posts, :created_at, :datetime, default: DateTime.now
    end
  end