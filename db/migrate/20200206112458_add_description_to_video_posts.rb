class AddDescriptionToVideoPosts < ActiveRecord::Migration
    def change
      add_column :video_posts, :description, :string
    end
  end
  