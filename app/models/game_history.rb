class GameHistory < ApplicationRecord
  belongs_to :Game
  has_many :GameSource
  
end
