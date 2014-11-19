class AddComments < ActiveRecord::Migration

  def up
    create_table :comments do |t|
      t.integer :user_id
      t.integer :track_id
      t.integer :rating
      t.string :user_review
    end

  end

  def down
    drop_table :comments
  end

end
