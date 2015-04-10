require 'minitest_helper'

module TestRedtubeApi
  class TestConstants
    describe 'RedTube API', 'Gem constants' do
      # Website related constants
      it 'should have a version number' do
        RedtubeApi::VERSION.wont_be_nil
      end

      it 'should have a set protocol string' do
        RedtubeApi::PROTOCOL.must_equal 'http://'
      end

      it 'should have a set hostname' do
        RedtubeApi::HOST.must_equal 'api.redtube.com'
      end

      it 'should have the complete website address via protocol + addition' do
        RedtubeApi::WEBSITE_URL.must_equal 'http://api.redtube.com/'
      end

      it 'should have the site root endpoint frozen' do
        RedtubeApi::SITE_ROOT.must_equal '/'
      end

      # File format related constants
      it 'should have the XML format frozen' do
        RedtubeApi::XML.must_equal 'xml'
      end

      it 'should have the JSON format frozen' do
        RedtubeApi::JSON.must_equal 'json'
      end

      it 'should have the YAML format frozen' do
        RedtubeApi::YAML.must_equal 'yaml'
      end

      # Video data types for API endpoints
      it 'should have the search video query data value frozen' do
        RedtubeApi::SEARCH_VIDEOS.must_equal 'redtube.Videos.searchVideos'
      end

      it 'should have the get video by ID query data value frozen' do
        RedtubeApi::GET_VIDEO_BY_ID.must_equal 'redtube.Videos.getVideoById'
      end

      it 'should have the YAML format frozen' do
        RedtubeApi::IS_VIDEO_ACTIVE.must_equal 'redtube.Videos.isVideoActive'
      end

      it 'should have the site root endpoint frozen' do
        RedtubeApi::GET_VIDEO_EMBED_CODE.must_equal 'redtube.Videos.getVideoEmbedCode'
      end

      it 'should have the site root endpoint frozen' do
        RedtubeApi::GET_DELETED_VIDEOS.must_equal 'redtube.Videos.getDeletedVideos'
      end
    end
  end
end
