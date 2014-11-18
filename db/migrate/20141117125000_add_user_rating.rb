class AddUserRating < ActiveRecord::Migration

  def up
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :track_id
      t.integer :rating
    end

  end

  def down
    drop_table :ratings
  end
end
