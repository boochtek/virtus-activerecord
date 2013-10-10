require 'active_record'

class Virtus::ActiveRecord::Model < ActiveRecord::Base
  include Virtus.model
end
