module AzureDocs
  module Utils
    module Cmd
      def run(cmd)
        say("running: #{cmd}")
        Open3.popen3(cmd) do |_, stdout, stderr, thread|
          {:out => stdout, :err => stderr}.each do |key, stream|
            Thread.new do
              until (line = stream.gets).nil? do
                # yield the block depending on the stream
                if block_given?
                  if key == :out
                    yield line, nil, thread
                  else
                    yield nil, line, thread
                  end
                else
                  say(line)
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