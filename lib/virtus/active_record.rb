require 'virtus'
require 'virtus/active_record/version'
require 'virtus/active_record/model'

module Virtus
  module ActiveRecord
    def self.model
      Model
    end
  end
end
