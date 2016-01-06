module AzureDocs
  module CLI
    class Build < ExitingThor
      include AzureDocs::Utils::Cmd

      def self.build_method_name(project_path)
        ('build_' + project_path.split('/').first).underscore
      end

      desc 'java [ROOT]', 'build the azure java SDKs, based on the root directory provided'
      def java(root='.')
        @root = root
        JAVA_PROJECTS_PATHS.each do |project_path|
          send(self.class.build_method_name(project_path))
        end
      end

      private

      JAVA_PROJECTS_PATHS.each do |project_path|
        define_method(self.build_method_name(project_path)) do
          maven_compile(File.join(*project_path.split('/')))
        end
      end

      def maven_compile(path)
        Dir.chdir File.expand_path(File.join(@root, path)) do
          run('mvn compile')
        end
      end
    end
  end
end
