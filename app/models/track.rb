class Track < ActiveRecord::Base

  has_many :ratings
  has_many :reviews
  belongs_to :user

  def average_rating
    self.ratings.average(:rating).to_f.round(1)
  end

end