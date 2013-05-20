require "sinatra/promises/version"

module Sinatra
  module Promises
    def self.included(klass)
      klass.send(:alias_method, :old_invoke, :invoke)
      klass.send(:alias_method, :invoke, :async_handler)
    end

    def async_handler
      res = catch(:halt) {yield}
      old_invoke do
        res
      end
    end
  end
end

Sinatra::Base.send(:include, Sinatra::Promises)
