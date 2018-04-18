# Frozen-string-literal: true
# Copyright: 2018 - Apache 2.0 License
# Encoding: utf-8

module Jekyll
  module Tilt
    module Converters
      autoload :Base, "jekyll/tilt/converters/base"

      # --
      # Require all our converters
      # @note we cannot autoload these!
      # @return [nil]
      # --
      def self.setup!
        dir = Pathutil.new(__dir__).join("converters")
        dir.children do |v|
          unless v.directory?
            require v
          end
        end
      end
    end
  end
end
