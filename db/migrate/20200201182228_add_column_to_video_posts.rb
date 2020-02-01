class AddColumnToVideoPosts < ActiveRecord::Migration
  def change
    add_column :video_posts, :video, :string
  end
end
