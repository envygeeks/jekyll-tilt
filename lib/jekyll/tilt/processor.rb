# Frozen-string-literal: true
# Copyright: 2018 - Apache 2.0 License
# Encoding: utf-8

module Jekyll
  module Tilt
    class Processor
      @inherited = []

      # --
      # Allows us to track inherited
      # @return [Array<Object>]
      # --
      def self.inherited(const = nil)
        return @inherited unless const
        @inherited |= [
          const,
        ]
      end

      # --
      # Allows you to set an extension
      # @note We will create the Jekyll shims
      # rubocop:disable Metrics/LineLength
      # @return [nil]
      # --
      def self.for_ext(ext)
        ext = ext.gsub(%r!^\.!, "")
        k = const_set(:Converter, Class.new(Converter))
        send(:define_singleton_method, :matches) { |e| e == ext || e == ".#{ext}" }
        k.send(:define_method, :matches) { |e| e == ext || e == ".#{ext}" }
        k.send(:define_method, :output_ext) { |*| ".html" }
        k.send(:define_method, :convert) { |c| c }
      end

      # --
      # Finds the const that handles an ext
      # @return [Array<Object>]
      # --
      def self.find_for(ext)
        inherited.select do |v|
          v.matches(ext)
        end
      end

      # --
      # Runs the consts on the content
      # @param out [String] the content to output
      # @return [String]
      # --
      def self.run_for(out, ext:, var: {})
        find_for(ext).each do |v|
          out = v.run_for(out, **var)
        end

        out
      end
    end
  end
end

require "jekyll/tilt/processors/erb"
require "jekyll/tilt/processors/erubis"
require "jekyll/tilt/processors/sigil"
require "jekyll/tilt/processors/haml"
