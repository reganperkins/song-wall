class User < ActiveRecord::Base

  has_many :tracks
  has_many :reviews
  has_many :ratings  #, through: :tracks
  
  validates :email, :username, :password, presence: true

end