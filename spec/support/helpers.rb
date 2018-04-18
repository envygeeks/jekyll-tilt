# Frozen-string-literal: true
# Copyright: 2018 - Apache 2.0 License
# Encoding: utf-8

require "forwardable/extended"
require "nokogiri"

module Helpers
  extend Forwardable::Extended
  rb_delegate :stub_jekyll_site, to: :Helpers

  # --
  # @return [Nokogiri::HTML::Fragment]
  # Create an HTML fragment.
  # --
  def fragment(html)
    Nokogiri::HTML.fragment(html)
  end

  # --
  # Silence all output
  # @return [yield]
  # --
  def self.silence_stdout
    stdout, stderr = $stdout, $stderr
    $stdout = StringIO.new
    $stderr = StringIO.new

    yield
  ensure
    $stdout = stdout
    $stderr = stderr
  end

  # --
  # Stub the Jekyll configuration
  # @return [Hash]
  # --
  def stub_jekyll_config(hash)
    hash = hash.deep_stringify_keys
    hash = jekyll.config.deep_merge(hash)
    allow(jekyll).to(receive(:config)
      .and_return(hash))
  end

  # --
  # Cleanup our garbage
  # @return [nil]
  # --
  def self.cleanup_trash
    Pathutil.new(fixture_path).join("_site").rm_rf
    %w(.jekyll-metadata .sass-cache .jekyll-cache).each do |v|
      Pathutil.pwd.join(v).rm_rf
    end
  end

  # --
  # Create a new Jekyll site
  # @return [Jekyll::Site]
  # --
  def self.stub_jekyll_site
    @jekyll ||= begin
      silence_stdout do
        cfg = Pathutil.new(fixture_path).join("_config.yml").read_yaml
        cfg = Jekyll.configuration(cfg).update({
          "destination" => File.join(fixture_path, "_site"),
          "source" => fixture_path.to_s,
        })

        Jekyll::Site.new(cfg).tap(&:process)
      end
    end
  end

  # --
  # The path to our Jekyll site fixture
  # @return [String]
  # --
  def self.fixture_path
    File.expand_path("../fixture", __dir__)
  end
end

# --
# Configure RSpec
# @return [nil]
# --
RSpec.configure do |c|
  c.before(:suite) { Helpers.tap(&:cleanup_trash).stub_jekyll_site }
  c. after(:suite) { Helpers.cleanup_trash }
  c.include Helpers
  c.extend  Helpers
end
