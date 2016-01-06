require 'open3'

# required gems
require 'thor'
require 'active_support/inflector'
require 'active_support/concern'
require 'mkmf'
require 'fileutils'

JAVA_PROJECTS_PATHS = %w(sdk-for-java storage-java documentdb-java notificationhubs-java-backend/NotificationHubs)
REPO_MANIFEST = 'https://github.com/devigned/azure-manifest'

module AzureDocs
  module CLI
    autoload :Init, 'azure_doc/cli/init'
    autoload :ExitingThor, 'azure_doc/cli/exiting_thor'
    autoload :Build, 'azure_doc/cli/build'
    autoload :Docs, 'azure_doc/cli/docs'
  end
  module Utils
    autoload :Cmd, 'azure_doc/utils/cmd'
  end
  autoload :DocCLI, 'azure_doc/cli'
end