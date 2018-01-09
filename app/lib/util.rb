class Util

  def init_scrap_names
    ScrapIgdbJob.perform_later(48,'ps4')
  end
end
