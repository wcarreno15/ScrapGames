class Game < ApplicationRecord
  has_many :GameHistory
  has_many :GameSource

  def ScrapGames
    
  end
end
