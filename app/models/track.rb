class Track < ActiveRecord::Base

  has_many :ratings

  def average_rating
    self.ratings.average(:rating).to_f.round(1)
  end

end