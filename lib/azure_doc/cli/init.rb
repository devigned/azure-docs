module AzureDocs
  module CLI
    module Init
      extend ActiveSupport::Concern
      include AzureDocs::Utils::Cmd

      included do

        desc 'start', 'init and sync the azure projects from a repo manifest'
        option :root, default: '.', aliases: :r, type: :string
        option :manifest, default: REPO_MANIFEST, aliases: :m, type: :string
        option :opts, type: :hash, default: {}, aliases: :o
        option :force, type: :boolean, default: false, aliases: :f

        def start
          verify_tools unless options[:force]
          start_repo(options[:root], options[:manifest], options[:opts])
        end

        desc 'cleanup', 'remove the azure projects and delete the .repo dir'
        option :root, default: '.', alias: 'r', type: :string

        def cleanup
          root = File.expand_path(options[:root])
          Dir.chdir root do
            if Dir.exist?('.repo')
              run("repo forall -c 'rm -rf $(pwd)'")
              run('rm -rf .repo')
            end
          end
        end

        private

        def verify_tools
          if !find_executable('repo')
            raise Thor::Error.new("please install repo (https://code.google.com/p/git-repo/) or make sure it's on your path")
          elsif !find_executable('gpg')
            raise Thor::Error.new('please install gpg')
          end
        end

        def start_repo(root, manifest, opts)
          Dir.chdir File.expand_path(root) do
            run("repo init -u #{manifest} #{opts.map { |key, value| "-#{key.to_s} #{value}" }.join(' ')}")
            run('repo sync')
          end
        end
      end
    end
  end
end

