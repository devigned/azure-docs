module AzureDocs
  module CLI
    class ExitingThor < Thor
      include Thor::Actions

      def self.exit_on_failure?
        true
      end
    end
  end
end