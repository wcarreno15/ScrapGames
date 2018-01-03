class Game < ApplicationRecord
  has_many :GameHistory
  has_many :GameSource
  has_one :ConsoleType

  def self.save_game(response, console_type)
    response.each do |game|
      games = Game.new
      games.name = game["name"]
      games.code = game["slug"]
      games.console_types_id = console_type[:id]

      games.save! unless validate_game(games.name).present?
    end
  end

  def self.validate_game(game)
    Game.where("name like ?", game)
  end

end
