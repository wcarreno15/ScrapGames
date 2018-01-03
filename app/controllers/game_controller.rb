class GameController < ApplicationController

  def index
    ScrapIgdbJob.perform(48)
  end

  def self.scrap
    ScrapIgdbJob.perform(48)
  end
end
