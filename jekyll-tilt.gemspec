# Frozen-string-literal: true
# Copyright: 2018 - Apache 2.0 License
# Encoding: utf-8

$LOAD_PATH.unshift(File.expand_path("lib", __dir__))
require "jekyll/tilt/version"

Gem::Specification.new do |s|
  s.require_paths = ["lib"]
  s.authors = ["Jordon Bedwell"]
  s.version = Jekyll::Tilt::VERSION
  s.homepage = "http://github.com/anomaly/jekyll-tilt/"
  s.files = %w(Rakefile Gemfile README.md LICENSE) + Dir["lib/**/*"]
  s.summary = "Preprocess your templates with Tilt"
  s.required_ruby_version = ">= 2.3.0"
  s.email = ["jordon@envygeeks.io"]
  s.license = "Apache-2.0"
  s.name = "jekyll-tilt"

  s.add_runtime_dependency("jekyll", "~> 3.5")
  s.add_runtime_dependency("tilt", "~> 2.0")
end
