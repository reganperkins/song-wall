class AddTracks < ActiveRecord::Migration
  def up
    create_table :tracks do |t|
      t.string :song_title
      t.string :author
      t.string :url
      t.timestamps
    end
  end

  def down
    drop_table :tracks
  end
end
