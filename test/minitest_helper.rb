require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'redtube_api'
require 'hurley/test'
require 'minitest/autorun'

module TestRedtubeApi
end
