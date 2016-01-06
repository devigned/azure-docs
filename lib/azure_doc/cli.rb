module AzureDocs
  class DocCLI < CLI::ExitingThor
    include AzureDocs::CLI::Init

    desc 'build COMMANDS', 'Build commands for SDKs'
    subcommand 'build', AzureDocs::CLI::Build

    desc 'gen COMMANDS', 'Documentation generation commands for SDKs'
    subcommand 'gen', AzureDocs::CLI::Docs

  end
end