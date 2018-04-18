# Frozen-string-literal: true
# Copyright: 2018 - Apache 2.0 License
# Encoding: utf-8

module Jekyll
  module Tilt
    module Processors
      class Erubis < Processor
        for_ext "erubis"
        def self.run_for(content, **vars)
          Upstream::ErubisTemplate.new { content }
            .render(**vars)
        end
      end
    end
  end
end
