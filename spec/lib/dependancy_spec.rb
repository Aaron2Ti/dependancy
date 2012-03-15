require 'spec_helper'
require 'dependancy'

describe Dependancy do
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

    dependancy :bar3 do
      Blur.new
    end

    dependancy :bar4
  end

  it '._dependancies' do
    Foo._dependancies.should have(4).items
    Foo._dependancies.should == [:bar1, :bar2, :bar3, :bar4]
  end

  it 'dependancy have default value' do
    foo = Foo.new
    foo.bar1.should be_a Bar
  end

  it 'dependancy could access current object' do
    foo = Foo.new
    bar = foo.bar2
    bar.name.should == 'foo name'
  end

  it 'assign a new dependancy' do
    foo = Foo.new
    old_bar = foo.bar1
    foo.bar1 = Bar.new

    foo.bar1.should_not == old_bar
  end

  it 'have nil value if there is error' do
    foo = Foo.new
    foo.bar3.should be_nil
  end
end
