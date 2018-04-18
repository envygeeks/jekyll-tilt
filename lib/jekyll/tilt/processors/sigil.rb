# Frozen-string-literal: true
# Copyright: 2018 - Apache 2.0 License
# Encoding: utf-8

module Jekyll
  module Tilt
    module Processors
      class Sigil < Processor
        for_ext "sigil"
        def self.run_for(content, **vars)
          Upstream::SigilTemplate.new { content }
            .render(**vars)
        end
      end
    end
  end
end
