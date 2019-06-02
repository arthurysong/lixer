class CreateVideoPosts < ActiveRecord::Migration
  def change
    create_table :video_posts do |t|
      t.string :title
      t.string :video_link
      t.integer :creator_id
    end
  end
end
