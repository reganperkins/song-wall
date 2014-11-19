class AddTracks < ActiveRecord::Migration

  def up
    create_table :tracks do |t|
      t.string :song_title
      t.string :artist
      t.string :url
      t.integer :user_id
      # t.integer :rating
      t.timestamps
    end
  end

  def down
    drop_table :tracks
  end
end

