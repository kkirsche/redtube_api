# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redtube_api/version'

Gem::Specification.new do |spec|
  spec.name          = "redtube_api"
  spec.version       = RedtubeApi::VERSION
  spec.authors       = ["Kevin Kirsche"]
  spec.email         = ["Kev.Kirsche@gmail.com"]

  spec.summary       = %q{Unoffical API wrapper for the RedTube developer API.}
  spec.description   = %q{Unofficial API wrapper for the RedTube developer API giving you the ability to easily work with all of the features within this adult website.}
  spec.homepage      = "https://github.com/kkirsche/redtube_api/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.6"
  spec.add_runtime_dependency "hurley", "~> 0.1"
end
