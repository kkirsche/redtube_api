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

    def get(type, args, symbols)
      request_args = symbols.map { |sym| args[sym] unless args[sym.nil?] }
      request_args[:data] = type
      request_args[:output] = 'json'
      @client.get('', request_args)
    end

    # == Search Videos
    # The Search Videos API endpoint allows us to search for a video of your choice.
    #
    # ==== Example
    #
    #    videos = RedtubeApi::Client.new.search_videos category: 'Blowjobs', page: 2
    #
    def search_videos(args = {})
      get('redtube.Videos.searchVideos', args,
        [:category, :page, :search, :tags, :stars,
         :thumbsize, :ordering, :period])
    end

    # == Get Video By ID
    # The Get Video By ID API endpoint allows us to retrieve additional information about specific video by +video_id+ parameter.
    #
    # ==== Example
    #
    #    videos = RedtubeApi::Client.new.get_video_by_id video_id: '179543', thumbsize: 'big'
    #
    def get_video_by_id(args = {})
      fail ':video_id was either not detected or was not of type Integer.' \
        'Please provide an integer :video_id.' unless args[:video_id].is_a? Integer
      fail 'Invalid thumbsize. Possible values are small, medium, medium1,' \
           ' medium2, big, or all.' unless
           ['medium', 'small', 'big', 'all', 'medium1',
            'medium2'].include? args[:thumbsize]
      get('redtube.Videos.getVideoById', args,
        [:video_id, :thumbsize])
    end

    # == Is Video Active
    # Retrieves state of a specific video specified by +video_id+ parameter, which is useful in order to keep your embedded videos up to date.
    #
    # ==== Example
    #
    #    videos = RedtubeApi::Client.new.is_video_active video_id: '179543'
    #
    def is_video_active(args = {})
      fail ':video_id was either not detected or was not of type Integer.' \
        'Please provide an integer :video_id.' unless args[:video_id].is_a? Integer
      get('redtube.Videos.isVideoActive', args,
        [:video_id])
    end

    # == Get Video Embed Code
    # Retrieves embed code (BASE64 encoded) for specific video by +video_id+ parameter, which is useful to automatically embed videos.
    #
    # ==== Example
    #
    #    videos = RedtubeApi::Client.new.get_video_embed_code video_id: '179543'
    #
    def get_video_embed_code(args = {})
      fail ':video_id was either not detected or was not of type Integer.' \
        'Please provide an integer :video_id.' unless args[:video_id].is_a? Integer
      get('redtube.Videos.getVideoEmbedCode', args,
        [:video_id])
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
      get('redtube.Videos.getDeletedVideos', args,
        [:page])
    end
  end
end
