class RemoveColumnFromVideoPosts < ActiveRecord::Migration
    def change
      remove_column :video_posts, :video_link, :string
    end
  end
  