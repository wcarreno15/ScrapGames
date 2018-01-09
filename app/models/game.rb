class Game < ApplicationRecord
  has_many :GameHistory
  has_many :GameSource

  def ScrapGamesIgdb
    ScrapIgdbJob.perform(48)

  end

end
