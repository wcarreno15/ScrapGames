class GameController < ApplicationController

  def index
    ScrapIgdbJob.set(wait: 1.minute).perform_later(48, 'ps4')
  end

  def init_scrap
    ScrapgdbJob.perform_later(48, 'ps4')
  end
end
