module AzureDocs
  module Utils
    module Cmd
      def run(cmd)
        Open3.popen3(cmd) do |_, stdout, stderr, thread|
          { :out => stdout, :err => stderr }.each do |key, stream|
            Thread.new do
              until (line = stream.gets).nil? do
                # yield the block depending on the stream
                if key == :out
                  yield line, nil, thread if block_given?
                else
                  yield nil, line, thread if block_given?
                end
              end
            end
          end
          thread.join
        end
      end
    end
  end
end