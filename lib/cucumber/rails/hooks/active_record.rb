require 'cucumber/rails/database'

if defined?(ActiveRecord::Base)
  class ActiveRecord::Base
    class_attribute :shared_connection

    def self.connection
      self.shared_connection || retrieve_connection
    end
  end
  
  Before(Cucumber::Rails::Database.before_js_tags) do
    Cucumber::Rails::Database.before_js
  end

  Before(*Cucumber::Rails::Database.before_non_js_tags) do
    Cucumber::Rails::Database.before_non_js
  end
end
