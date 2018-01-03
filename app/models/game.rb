class Game < ApplicationRecord
  has_many :GameHistory
  has_many :GameSource

  def self.save_game(response)
    response.each do |game|
      games = Game.new
      games.name = game["name"]
      games.code = game["slug"]

      games.save! unless validate_game(games.name).present?
    end
  end

  def self.validate_game(game)
    Game.where("name like ?", game)
  end

end
