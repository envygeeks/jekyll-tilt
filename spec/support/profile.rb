# Frozen-string-literal: true
# Copyright: 2018 - Apache 2.0 License
# Encoding: utf-8

unless ENV["CI"] == "true"
  RSpec.configure do |c|
    c.profile_examples = true
  end
end
