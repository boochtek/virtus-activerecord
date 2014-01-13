require 'active_record'
require 'includable/activerecord'


# Allow subclassing Virtus::ActiveRecord::Model, although it's preferred to include Virtus::ActiveRecord.model instead.
class Virtus::ActiveRecord::Model < ActiveRecord::Base
  include Virtus.model
end


# This module is the minimum that will be included in all models using Virtus::ActiveRecord.
# Other modules may be mixed into this dynamically, depending on options passed to Virtus::ActiveRecord.model.
module Virtus::ActiveRecord::BaseModule
  def self.included(base)
    base.__send__(:include, ::ActiveRecord::Model)
    base.__send__(:include, ::Virtus.model)
  end
end
