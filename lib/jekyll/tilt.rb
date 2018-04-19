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
      Jekyll::Hooks.register(:site, :pre_render) { |s, _| convert_l!(s) }
      Jekyll::Hooks.register [:documents, :pages], :pre_render do |d, _|
        convert_d!(d)
      end
    end

    # --
    # Convert layouts
    # @return [nil]
    # --
    def self.convert_l!(site)
      site.layouts.each_value do |v|
        convert_d!(v)
      end
    end

    # --
    # Convert pages
    # @return [nil]
    # --
    def self.convert_d!(doc)
      doc.content = Processor.run_for(doc.content, {
        ext: doc.ext,
      })
    end

    setup!
  end
end
