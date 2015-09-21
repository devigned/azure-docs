require 'open3'

# required gems
require 'thor'

module AzureDocs
  module CLI
    autoload :ExitingThor, 'azure_doc/cli/exiting_thor'
    autoload :Build, 'azure_doc/cli/build'
  end
  module Utils
    autoload :Cmd, 'azure_doc/utils/cmd'
  end
  autoload :DocCLI, 'azure_doc/cli'
end