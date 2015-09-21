module AzureDocs
  class DocCLI < CLI::ExitingThor
    desc 'build COMMANDS', 'Build commands for SDKs'
    subcommand 'build', AzureDocs::CLI::Build
  end

  class DocCLI < CLI::ExitingThor
    desc 'gen COMMANDS', 'Documentation generation commands for SDKs'
    subcommand 'gen', AzureDocs::CLI::Docs
  end
end