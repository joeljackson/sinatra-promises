# coding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'sinatra/promises/version'

Gem::Specification.new do |spec|
  spec.name          = "sinatra-promises"
  spec.version       = Sinatra::Promises::VERSION
  spec.authors       = ["Joel Jackson"]
  spec.email         = ["jackson.joel@gmail.com"]
  spec.description   = %q{Wraps your sinatra requests in a comforting promise so you can relax}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/joeljackson/sinatra-promises"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "sinatra"
  spec.add_dependency "em-promise"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
