require 'rails/generators/migration'

module YmDocuments
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      desc "Installs YmDocuments."

      source_root File.expand_path("../templates", __FILE__)

      def manifest
        # models
        copy_file "models/document.rb",           "app/models/document.rb"

        # views

        # controllers
        copy_file "controllers/documents_controller.rb",   "app/controllers/documents_controller.rb"

        # migrations
        begin
          migration_template "migrations/create_documents.rb", "db/migrate/create_documents.rb"
        rescue Rails::Generators::Error => e
          puts e
        end

        # initializers
        copy_file 'initializers/ym_documents.rb',
          'config/initializers/ym_documents.rb'

          # stylesheets

        #Copy features folder
        # directory "../../../../features/", "features"
      end

    end
  end
end

