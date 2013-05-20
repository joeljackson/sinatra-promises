require "sinatra/promises/version"

module Sinatra
  module Promises
    def self.included(klass)
      klass.send(:alias_method, :old_invoke, :invoke)
      klass.send(:alias_method, :invoke, :async_handler)
    end

    def async_handler
      res = catch(:halt) {yield}
      if res.is_a?(EventMachine::Q::Promise)
        res.then do |result|
          body result
          request.env['async.callback'].call(@response.finish)
        end
        throw :async
      else
        old_invoke do
          res
        end
      end
    end
  end
end

Sinatra::Base.send(:include, Sinatra::Promises)
