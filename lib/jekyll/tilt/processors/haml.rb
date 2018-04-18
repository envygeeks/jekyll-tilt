# Frozen-string-literal: true
# Copyright: 2018 - Apache 2.0 License
# Encoding: utf-8

module Jekyll
  module Tilt
    module Processors
      class Haml < Processor
        for_ext "haml"
        def self.run_for(content, **vars)
          Upstream::HamlTemplate.new { content }
            .render(**vars)
        end
      end
    end
  end
end
