module AzureDocs
  class DocCLI < CLI::ExitingThor
    desc 'build COMMANDS', 'Build commands for SDKs'
    subcommand 'build', AzureDocs::CLI::Build
  end
end