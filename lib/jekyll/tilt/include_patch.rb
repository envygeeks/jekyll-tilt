# Frozen-string-literal: true
# Copyright: 2018 - Apache 2.0 License
# Encoding: utf-8

module Jekyll
  module Tags
    class IncludeTag
      def read_file(file, ctx)
        pth = Pathutil.new(file)
        out = pth.read(file_read_opts(ctx))
        Tilt::Processor.run_for(out, {
          ext: pth.extname,
        })
      end
    end
  end
end
