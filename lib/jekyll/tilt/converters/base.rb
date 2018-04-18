# Frozen-string-literal: true
# Copyright: 2018 - Apache 2.0 License
# Encoding: utf-8

module Jekyll
  module Tilt
    module Converters
      module Base

        # --
        # @return [String]
        # The output ext
        # --
        def output_ext(*)
          ".html"
        end

        # --
        # @return [String]
        # Pretend we convert anything Jekyll gives us
        # @note we pre-process so that we stay out of the
        #   way of things like Jekyll-Assets
        # --
        def convert(content)
          content
        end
      end
    end
  end
end
