require 'virtus/active_record'

describe 'Including Virtus::ActiveRecord.model' do
  before do
    module Examples
      class User < Virtus::ActiveRecord.model
        attribute :name, String
        attribute :age,  Integer, required: false
      end
    end
  end

  it 'works' do
    expect { Examples::User.new(name: 'Craig') }.not_to raise_exception
  end
end
