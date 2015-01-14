require 'database_cleaner/mongoid/base'
require 'database_cleaner/generic/truncation'
require 'database_cleaner/moped/deletion_base'
require 'mongoid/version'

module DatabaseCleaner
  module Mongoid
    class Deletion
      include ::DatabaseCleaner::Mongoid::Base
      include ::DatabaseCleaner::Generic::Truncation

      include ::DatabaseCleaner::Moped::DeletionBase

      private

      def session
        ::Mongoid.default_session
      end

      def database
        if not(@db.nil? or @db == :default)
          ::Mongoid.databases[@db]
        else
          ::Mongoid.database
        end
      end
    end
  end
end
