module AzureDocs
  module CLI
    class Docs < ExitingThor
      include AzureDocs::Utils::Cmd

      def self.gen_method_name(project_path)
        ('gen_' + project_path.split('/').first).underscore
      end

      desc 'java [ROOT] [OUT_DIR]', <<-DESC
Generate the azure java SDKs documentation, based on the root and
output directories provided. Should be run after `build java`
DESC
      def java(root='.', outdir='.')
        @root = root
        JAVA_PROJECTS_PATHS.each do |project_path|
          send(self.class.gen_method_name(project_path))
        end
      end

      private

      JAVA_PROJECTS_PATHS.each do |project_path|
        define_method(self.gen_method_name(project_path)) do
          generate_java_docs(File.join(*project_path.split('/')))
        end
      end

      def generate_java_docs(path)
        Dir.chdir File.expand_path(File.join(@root, path)) do
          run('mvn javadoc:javadoc')
        end
      end
    end
  end
end