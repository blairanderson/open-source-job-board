require 'net/http'
require 'json'
require 'open-uri'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class Fetchers::Stackoverflow
  RSS_TO_JSON = "https://ajax.googleapis.com/"
  API_EXAMPLE = "http://careers.stackoverflow.com/jobs/feed?range=100&distanceUnits=Miles&searchTerm=react native&location=new+york"
  TERMS       = ["reactjs", "react native"]
  LOCATIONS   = ["san francisco", "new york", "seattle", "remote"]

  def self.all
    results = []
    TERMS.each do |term|
      LOCATIONS.each do |location|
        results << {
          'feed' => "http://careers.stackoverflow.com/jobs/feed?range=100&distanceUnits=Miles&searchTerm=#{term}&location=#{location}",
          'term' => term,
          'location' => location
        }
      end
    end
    results
  end

  def self.run
    self.all.each do |term_loc_feed|
      before = RawPostData.count
      self.persist(term_loc_feed)
      after = RawPostData.count
      puts "#{after - before} posts created"
    end
  end

  def self.persist(term_loc_feed)
    term      = term_loc_feed.fetch('term',nil)
    location  = term_loc_feed.fetch('location', nil)
    feed      = term_loc_feed.fetch('feed', nil)

    return false unless (term && location && feed)

    escaped   = URI.escape(feed, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    url       =  "#{RSS_TO_JSON}ajax/services/feed/load?v=1.0&userip=50.46.246.110&q=#{escaped}"
    content   = get_json(url)
    entries   = content
                  .fetch('responseData', {})
                  .fetch('feed', {})
                  .fetch('entries', [])

    entries.each do |data|
      RawPostData.stackoverflow.where({identifier: data['link']}).first_or_create do |persisted|
        puts data["link"]
        persisted.term = term
        persisted.location = location
        persisted.data = data
      end
    end
  end

  def self.get_json(uri)
    JSON.load(open(uri))
  end
end
