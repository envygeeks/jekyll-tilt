# Frozen-string-literal: true
# Copyright: 2018 - Apache 2.0 License
# Encoding: utf-8

require "jekyll"
require "pathutil"
require "tilt"

module Jekyll
  module Tilt
    Upstream = ::Tilt
    autoload :Converters, "jekyll/tilt/converters"
    autoload :VERSION,
      "jekyll/tilt/version"

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
        parser = get_parser_for(v.ext)

        next if parser == :next
        v.content = parser.new do
          v.content
        end.render
      end
    end

    # --
    # Convert pages
    # @return [nil]
    # --
    def self.convert_p!(site)
      site.pages.each do |v|
        parser = get_parser_for(v.ext)

        next if parser == :next
        v.content = parser.new ugly: false, format: :html5 do
          v.content
        end.render
      end
    end

    # --
    # Get the parser for an extension.
    # @return [Upstream::*]
    # --
    def self.get_parser_for(ext)
      case ext
      when ".haml" then Upstream::HamlTemplate
      when ".erubis" then Upstream::ErubisTemplate
      when ".sigil" then Upstream::SigilTemplate
      when ".erb" then Upstream::ERBTemplate
      else
        :next
      end
    end

    setup!
    Converters.setup!
  end
end
