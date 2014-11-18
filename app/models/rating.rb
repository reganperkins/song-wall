class Rating < ActiveRecord::Base

  belongs_to :user   # user_id
  belongs_to :track  # track_id

end