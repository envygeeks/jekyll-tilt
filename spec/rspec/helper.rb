# Frozen-string-literal: true
# Copyright: 2018 - Apache 2.0 License
# Encoding: utf-8

$VERBOSE = nil
require "rspec"
require "support/coverage"
require "luna/rspec/formatters/checks"
require "jekyll/assets"
require "jekyll/tilt"
require "jekyll"

Dir[File.expand_path("../support/*.rb", __dir__)].each do |v|
  require v
end
