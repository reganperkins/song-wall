class CreateSongRating < ActiveRecord::Migration

  def up
    create_table :song_ratings do |t|
      t.integer :user_id
      t.integer :track_id
      t.integer :rating
    end

  end

  def down
    drop_table :song_ratings
  end
end
