# Frozen-string-literal: true
# Copyright: 2018 - Apache 2.0 License
# Encoding: utf-8

RSpec.configure do |c|
  c.before :each do
    allow(Jekyll.logger.writer).to receive(:logdevice)
      .and_return(StringIO.new)
  end
end
