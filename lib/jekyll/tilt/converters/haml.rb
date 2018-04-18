# Frozen-string-literal: true
# Copyright: 2018 - Apache 2.0 License
# Encoding: utf-8

module Jekyll
  module Tilt
    module Converters
      class Haml < Jekyll::Converter
        include Base

        # --
        # The extension we match
        # @return [true, false]
        # --
        def matches(ext)
          ext == ".haml" || ext == "haml"
        end
      end
    end
  end
end
