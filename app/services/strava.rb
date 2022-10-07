class Strava
  def self.call
    new.call
  end

  def call
    get_request
  end

  def conn
    Faraday.new(url: 'https://www.strava.com') do |f|
      f.headers['Authorization'] = ENV['STRAVA_SECRET']
    end
  end

  def get_request
    conn.get('/api/v3/athlete')
  end
end
