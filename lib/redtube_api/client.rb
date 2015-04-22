require 'hurley'
require 'json'

# Module to hold the RedTube API Client
module RedtubeApi
  # Client for interacting with RedTube API
  class Client
    def initialization
      @client = Hurley::Client.new 'http://api.redtube.com/'
      self
    end

    private
    def validate(response)
      return true if response['code'].nil? && response[:code].nil?

      error_codes = [1001, 1002, 1003, 2001, 2002, 3001, 3002, 3003]

      fail 'Unknown error code. Please contact the developer at' \
        ' https://github.com/kkirsche/redtube_api/issues' \
        unless error_codes.include? response['code'].to_i || error_codes.include? response[:code].to_i

      fail 'No such method. Please contact the developer at' \
        ' https://github.com/kkirsche/redtube_api/issues' \
        if response['code'] == 1001 || response[:code] == 1001

      fail 'No such data provider. Please contact the developer at' \
        ' https://github.com/kkirsche/redtube_api/issues' \
        if response['code'] == 1002 || response[:code] == 1002

      fail 'No input parameters specified. Please contact the developer at' \
        ' https://github.com/kkirsche/redtube_api/issues' \
        if response['code'] == 1003 || response[:code] == 1003

      fail 'No videos found.' \
        if response['code'] == 2001 || response[:code] == 2001

      fail 'No video with this ID.' \
        if response['code'] == 2002 || response[:code] == 2002

      fail 'No categories found.' \
        if response['code'] == 3001 || response[:code] == 3001

      fail 'No tags found.' \
        if response['code'] == 3002 || response[:code] == 3002

      fail 'No stars found.' \
        if response['code'] == 3003 || response[:code] == 3003
    end

    def get(type, args, symbols, should_validate)
      request_args = symbols.map { |sym| args[sym] unless args[sym.nil?] }
      request_args[:data] = type
      request_args[:output] = 'json'
      response = JSON.parse(@client.get('', request_args).body)
      validate response unless should_validate

    end

    def receive_should_validate?(args)
      args[:should_validate] = true if args[:should_validate].nil?
    end

    def receive_video_id?(args)
      fail ':video_id was either not detected or was not of type Integer.' \
           'Please provide an integer :video_id.' unless args[:video_id].is_a? Integer
    end

    def receive_valid_thumbsize?(args)
      fail 'Invalid thumbsize. Possible values are small, medium, medium1,' \
           ' medium2, big, or all.' unless
           ['medium', 'small', 'big', 'all', 'medium1',
            'medium2'].include? args[:thumbsize]
    end

    public
    # == Search Videos
    # The Search Videos API endpoint allows us to search for a video of your choice.
    #
    # ==== Example
    #
    #    videos = RedtubeApi::Client.new.search_videos category: 'Blowjobs', page: 2
    #
    def search_videos(args = {})
      receive_should_validate? args

      get('redtube.Videos.searchVideos', args,
        [:category, :page, :search, :tags, :stars,
         :thumbsize, :ordering, :period], args[:should_validate])
    end

    # == Get Video By ID
    # The Get Video By ID API endpoint allows us to retrieve additional information about specific video by +video_id+ parameter.
    #
    # ==== Example
    #
    #    videos = RedtubeApi::Client.new.get_video_by_id video_id: '179543', thumbsize: 'big'
    #
    def get_video_by_id(args = {})
      receive_video_id? args
      receive_valid_thumbsize? args
      receive_should_validate? args

      get('redtube.Videos.getVideoById', args,
        [:video_id, :thumbsize], args[:should_validate])
    end

    # == Is Video Active
    # Retrieves state of a specific video specified by +video_id+ parameter, which is useful in order to keep your embedded videos up to date.
    #
    # ==== Example
    #
    #    videos = RedtubeApi::Client.new.is_video_active video_id: '179543'
    #
    def is_video_active(args = {})
      receive_video_id? args
      receive_should_validate? args

      get('redtube.Videos.isVideoActive', args,
        [:video_id], args[:should_validate])
    end

    # == Get Video Embed Code
    # Retrieves embed code (BASE64 encoded) for specific video by +video_id+ parameter, which is useful to automatically embed videos.
    #
    # ==== Example
    #
    #    videos = RedtubeApi::Client.new.get_video_embed_code video_id: '179543'
    #
    def get_video_embed_code(args = {})
      receive_video_id? args
      receive_should_validate? args

      get('redtube.Videos.getVideoEmbedCode', args,
          [:video_id], args[:should_validate])
    end

    # == Get Deleted Videos
    # Retrieves all deleted videos.
    #
    # ==== Example
    #
    #    videos = RedtubeApi::Client.new.get_deleted_videos video_id: '179543'
    #
    def get_deleted_videos(args = {})
      fail ':page was either not detected or was not of type Integer.' \
      'Please provide an integer :page.' unless args[:page].is_a? Integer

      receive_should_validate? args

      get('redtube.Videos.getDeletedVideos', args,
          [:page], args[:should_validate])
    end

    # == Get Categories List
    # Retrieves all categories available.
    #
    # ==== Example
    #
    #    videos = RedtubeApi::Client.new.get_categories_list
    #
    def get_categories_list
      receive_should_validate? args
      get('redtube.Categories.getCategoriesList', {}, [], args[:should_validate])
    end

    # == Get Tag List
    # Retrieves all tags available.
    #
    # ==== Example
    #
    #    videos = RedtubeApi::Client.new.get_tag_list
    #
    def get_tag_list
      receive_should_validate? args
      get('redtube.Tags.getTagList', {}, [], args[:should_validate])
    end

    # == Get Star List
    # Retrieves all pornstars available.
    #
    # ==== Example
    #
    #    videos = RedtubeApi::Client.new.get_star_list
    #
    def get_star_list
      receive_should_validate? args
      get('redtube.Stars.getStarList', {}, [], args[:should_validate])
    end

    # == Get Detailed Star List
    # Retrieves all pornstars available with details (page url and star's thumb).
    #
    # ==== Example
    #
    #    videos = RedtubeApi::Client.new.get_detailed_star_list
    #
    def get_detailed_star_list
      receive_should_validate? args
      get('redtube.Stars.getStarDetailedList', {}, [], args[:should_validate])
    end
  end
end
