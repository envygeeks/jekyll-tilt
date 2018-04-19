# Frozen-string-literal: true
# Copyright: 2018 - Apache 2.0 License
# Encoding: utf-8

require "rspec/helper"
describe Jekyll::Tilt do
  context "site.layouts" do
    it "works" do
      result = fragment(site.layouts["default"].content).css("body")
      expect(result).not_to be_empty
    end
  end

  #

  context "site.pages" do
    it "works" do
      result = fragment(site.pages.first.content).css("p")
      expect(result).not_to be_empty
    end
  end
end
