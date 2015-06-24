# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'highrise_insightly/version'

Gem::Specification.new do |spec|
  spec.name          = "highrise_insightly"
  spec.version       = HighriseInsightly::VERSION
  spec.authors       = ["Dan Pickett"]
  spec.email         = ["dan.pickett@launchacademy.com"]

  spec.summary       = %q{Import Highrise Notes to Insightly}
  spec.description   = %q{CLI for importing highrise notes to insightly}
  spec.homepage      = ""

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday'
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'thor'
  spec.add_dependency 'chronic'

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-mocks"
  spec.add_development_dependency "webmock"
end
