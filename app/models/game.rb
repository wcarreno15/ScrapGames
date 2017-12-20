class Game < ApplicationRecord
  has_many :GameHistory
  has_many :GameSource
end
