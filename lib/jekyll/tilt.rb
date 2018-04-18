# Frozen-string-literal: true
# Copyright: 2018 - Apache 2.0 License
# Encoding: utf-8

require "jekyll"
require "pathutil"
require "jekyll/tilt/processor"
require "jekyll/tilt/include_patch"
require "jekyll/tilt/version"
require "tilt"

module Jekyll
  module Tilt
    Upstream = ::Tilt

    # --
    # Register a hook
    # @return [nil]
    # --
    def self.setup!
      Jekyll::Hooks.register :site, :pre_render do |s, _|
        convert_p!(s)
        convert_l!(s)
      end
    end

    # --
    # Convert layouts
    # @return [nil]
    # --
    def self.convert_l!(site)
      site.layouts.each_value do |v|
        v.content = Processor.run_for(v.content, {
          ext: v.ext,
        })
      end
    end

    # --
    # Convert pages
    # @return [nil]
    # --
    def self.convert_p!(site)
      site.pages.each do |v|
        v.content = Processor.run_for(v.content, {
          ext: v.ext,
        })
      end
    end

    setup!
  end
end
