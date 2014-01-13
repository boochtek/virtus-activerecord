require 'virtus/active_record'

describe 'Including Virtus::ActiveRecord.model' do
  before do
    module Examples
      class User1 < Virtus::ActiveRecord::Base
        attribute :name, String
        attribute :age,  Integer, required: false
      end

      class User2
        include Virtus::ActiveRecord.model
        attribute :name, String
        attribute :age,  Integer, required: false
      end
    end
  end


  it 'works' do
    expect { Examples::User1.new(name: 'Craig') }.not_to raise_exception
    expect { Examples::User2.new(name: 'Craig') }.not_to raise_exception
  end
end
