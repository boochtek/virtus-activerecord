require 'virtus'
require 'virtus/active_record/version'
require 'virtus/active_record/model'


module Virtus
  module ActiveRecord
    # Returns a module that can be mixed into a model class.
    #
    # Example usage:
    #
    # class User
    #   include Virtus::ActiveRecord.model
    # end
    def self.model
      BaseModule
    end
  end
end
