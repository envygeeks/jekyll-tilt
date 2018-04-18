# Frozen-string-literal: true
# Copyright: 2018 - Apache 2.0 License
# Encoding: utf-8

module Jekyll
  module Tilt
    module Converters
      class Erubis < Jekyll::Converter
        include Base

        # --
        # The extension we match
        # @return [true, false]
        # --
        def matches(ext)
          ext == ".erubis" || ext == "erubis"
        end
      end
    end
  end
end
