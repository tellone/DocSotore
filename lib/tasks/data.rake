require File.join(File.dirname(__FILE__), '../../config/environment')
require 'database_cleaner'

namespace :docstor do
  namespace :data do

    task :delete do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.clean
    end

    task :load do
      require 'db/data.rb'
    end

    task :reload do
      Rake::Task['docstor:data:delete'].invoke
      Rake::Task['docstor:data:load'].invoke
    end

  end
end
