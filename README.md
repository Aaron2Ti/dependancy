# Dependancy

Getters & setters for dependency injection

## Installation

Add this line to your application's Gemfile:

    gem 'dependancy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dependancy

## Usage

```ruby
class Bar
  attr_accessor :name
end

class Foo
  include Dependancy

  def name
    'foo name'
  end

  dependancy :bar1 do
    Bar.new
  end

  dependancy :bar2 do |foo|
    bar = Bar.new
    bar.name = foo.name
    bar
  end

  dependancy :bar3
end

Foo._dependancies == [:bar1, :bar2, :bar3] # true
foo = Foo.new
foo.bar1.is_a? Bar # true
foo.bar2.is_a? Bar # true
foo.bar2.name == foo.name # true

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
