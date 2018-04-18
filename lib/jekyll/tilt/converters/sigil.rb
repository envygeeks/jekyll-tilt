# Frozen-string-literal: true
# Copyright: 2018 - Apache 2.0 License
# Encoding: utf-8

module Jekyll
  module Tilt
    module Converters
      class Sigil < Jekyll::Converter
        include Base

        # --
        # The extension we match
        # @return [true, false]
        # --
        def matches(ext)
          ext == ".sigil" || ext == "sigil"
        end
      end
    end
  end
end
