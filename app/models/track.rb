class Track < ActiveRecord::Base

  has_many :song_ratings
  has_many :comments
  belongs_to :user

# calculate the rating based on votes 
  def average_rating

    self.song_ratings.average(:rating).to_f.round(1)
  end

end