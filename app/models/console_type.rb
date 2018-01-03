class ConsoleType < ApplicationRecord
  has_many :Game

  scope :consoleTypeByCode, (->(code) { where('code like ?', code).first })
end
