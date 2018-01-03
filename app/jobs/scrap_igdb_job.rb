class ScrapIgdbJob < ApplicationJob
  queue_as :default

  def self.perform(plataform_id)
    puts "Scrapp IGDB"

    agent= Mechanize.new
    url = 'https://www.igdb.com/'
    agent.get(url)

    server_session = agent.cookies[1].value
    csrf = agent.cookies[2].value

    header = {
      'x-csrf-token' => csrf,
      'x-requested-with' => 'XMLHttpRequest',
      'x-newrelic-id' => 'UwcGVFBADQMBVVRR'
    }

    p = 0
    plataform_id = 48

    page = agent.get(
      "https://www.igdb.com/advanced_search?d=1&f[type]=games&s=score&p=#{p}&f[platforms.id_in]=#{plataform_id}",
      [],
      'https://www.igdb.com/advanced_search',
      header
    )
    response = JSON.parse page.body

    while response.any? do
      puts response
      Game.save_game(response)

      p += 1
      page = agent.get(
        "https://www.igdb.com/advanced_search?d=1&f[type]=games&s=score&p=#{p}&f[platforms.id_in]=#{plataform_id}",
        [],
        'https://www.igdb.com/advanced_search',
        header
      )
      puts "page: #{p}"

      response =  JSON.parse page.body
    end

  end
end
