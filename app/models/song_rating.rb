class SongRating < ActiveRecord::Base

  belongs_to :user   
  belongs_to :track  

  # after_create :calculate_upvote

  def review_rating
    self.ratings.average(:rating).to_f.round(1)
  end

  # private

  # def calculate_upvote
  #   self.rating.average_rating
  # end

end