# Frozen-string-literal: true
# Copyright: 2018 - Apache 2.0 License
# Encoding: utf-8

module Shared
  extend RSpec::SharedContext

  subject { described_class }
  let(:site) { stub_jekyll_site }
  let(:jekyll) { site }
end

RSpec.configure do |c|
  c.include Shared
end
