class ScrapGameWorker
  include Sidekiq::Worker

  def perform(name, count)
    # Do something
  end
end
