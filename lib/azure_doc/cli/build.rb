module AzureDocs
  module CLI
    class Build < ExitingThor
      include AzureDocs::Utils::Cmd

      desc 'java [ROOT]', 'build the azure java SDKs, based on the root directory provided'

      def java(root='.')
        @root = root
        build_azure_sdk
        build_storage
        build_document_db
        build_hubs_backend
      end

      private

      def maven_compile(path)
        Dir.chdir File.expand_path(File.join(@root, path)) do
          run('mvn compile') do |out, err, _|
            puts "#{out}" unless out.nil?
            puts "#{err}" unless err.nil?
          end
        end
      end

      def build_azure_sdk
        maven_compile 'sdk-for-java'
      end

      def build_storage
        maven_compile 'storage-java'
      end

      def build_document_db
        maven_compile 'documentdb-java'
      end

      def build_hubs_backend
        maven_compile File.join('notificationhubs-java-backend', 'NotificationHubs')
      end
    end
  end
end
