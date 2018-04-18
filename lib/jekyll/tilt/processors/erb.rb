# Frozen-string-literal: true
# Copyright: 2018 - Apache 2.0 License
# Encoding: utf-8

module Jekyll
  module Tilt
    module Processors
      class ERB < Processor
        for_ext "erb"
        def self.run_for(content, **vars)
          Upstream::ERBTemplate.new { content }
            .render(**vars)
        end
      end
    end
  end
end
