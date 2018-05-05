# Frozen-string-literal: true
# Copyright: 2018 - Apache 2.0 License
# Encoding: utf-8

module Jekyll
  module Tilt
    module Processors
      class Haml < Processor
        for_ext "haml"
        def self.run_for(content, **vars)
          Upstream::HamlTemplate.new(opts(vars)) { content }
            .render(**vars)
        end

        # --
        def self.opts(vars)
          out = vars[:site].config["haml"] || {}
          out.each_with_object({}) do |(k, v), h|
            h[k.to_sym] = v
          end
        end
      end
    end
  end
end
