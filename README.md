# Virtus::ActiveRecord

With this gem, you can define attributes within your ActiveRecord model classes.
This allows you to keep your model attributes and associations in one place.
You won't have to look in both the model class and the database schema to see everything.

You can then use a Rake task to create migrations, generating the schema from the class attributes.
Your model classes will check to ensure that the schema matches the attributes declared in the model class.


## Installation

Add this line to your application's Gemfile:

    gem 'virtus-activerecord'

And then execute:

    $ bundle


## Usage

To use Virtus::ActiveRecord, simply inherit from `Virtus::ActiveRecord::Base` instead of `ActiveRecord::Base`,
then define your attributes with `attribute`:

```ruby
class User < Virtus::ActiveRecord::Base
  attribute :name, String
  attribute :age, Integer
end
```

Better yet, instead of subclassing, just include `Virtus::ActiveRecord.model` in your model class:

```ruby
class User
  include Virtus::ActiveRecord.model  # Note the period and the lower-case 'm'.
  attribute :name, String
  attribute :age, Integer
end
```


You can use the Virtus DSL to fully specify the attributes:

```ruby
class User
  include Virtus::ActiveRecord.model
  attribute :name, String, required: true
  attribute :age, Integer, default: 0
  attribute :phone_numbers, Array[String], accessor: :private
end
```

In addition, Virtus::ActiveRecord adds some of its own specifications:

```ruby
class User
  include Virtus::ActiveRecord.model
  attribute :name, String, length: 100
  attribute :account_value, Fixnum, scale: 2
end
```

After making changes to model attributes, you'll need to update your database schema.
Simple run `rake db:migration:create`, review the migration file, then run `rake db:migrate`.
If you forget to create or run the migration, Virtus::ActiveRecord will notice that the
database schema does not match the attributes declared in your model, and raise an exception.

Once you've defined your attributes and run your migrations,
everything else works the same as ActiveRecord normally does.


## TODO

* Implement `rake db:migration:create` schema updating.
* Implement a way to copy DB schema from SQL DBs to model classes.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Make sure tests pass (`rspec` or `rake spec`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
