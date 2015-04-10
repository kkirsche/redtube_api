# Module to hold the RedTube API Client
module RedtubeApi
  # Domain URL Constants
  PROTOCOL = 'http://'.freeze
  HOST = 'api.redtube.com'.freeze
  WEBSITE_URL = "#{PROTOCOL}#{HOST}/".freeze
  SITE_ROOT = '/'.freeze

  # Format related constants
  JSON = 'json'.freeze
  XML = 'xml'.freeze
  YAML = 'yaml'.freeze

  # Video data types for API endpoints
  SEARCH_VIDEOS = 'redtube.Videos.searchVideos'.freeze
  GET_VIDEO_BY_ID = 'redtube.Videos.getVideoById'.freeze
  IS_VIDEO_ACTIVE = 'redtube.Videos.isVideoActive'.freeze
  GET_VIDEO_EMBED_CODE = 'redtube.Videos.getVideoEmbedCode'.freeze
  GET_DELETED_VIDEOS = 'redtube.Videos.getDeletedVideos'.freeze
end
