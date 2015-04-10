require 'hurley'

# Module to hold the RedTube API Client
module RedtubeApi
  class Client
    def initialization
      @client = Hurley::Client.new WEBSITE_URL
      ssl(arguments)
      @client.request_options.redirection_limit = 10

      @client
    end

    # == Search Videos
    # The Search Videos API endpoint allows us to
    #
    # ==== Example
    #
    #    client = Arbor::Peakflow::Client.new host: 'http://my.arbor.device/',
    #                                         api_key: 'myApiKeyHere123',
    #                                         ssl_verify: false,
    #                                         ca_path: '/usr/ssl/certs',
    #
    def search_videos (search = nil, page = nil, tags = nil, category = nil, stars = nil,
      thumbsize = 'all', ordering = 'rating', period = nil)

      Hash.new.tap do |hash|
        hash[:data] = SEARCH_VIDEOS
        hash[:page] = page unless page.nil?
        hash[:search] = search unless search.nil?
        hash[:tags] = tags unless tags.nil?
        hash[:category] = category unless category.nil?
        hash[:stars] = stars unless stars.nil?
        hash[:thumbsize] = thumbsize unless thumbsize.nil?
        hash[:ordering] = ordering unless ordering.nil?
        hash[:period] = period unless period.nil?
      end

      @response = @client.get SITE_ROOT, args

      puts @response.body
    end
  end
end
