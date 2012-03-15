require 'spec_helper'
require 'dependancy'

describe Dependancy do
  class Bar
    attr_accessor :name
  end

  class Foo
    extend Dependancy

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

    dependancy :bar4 do
      counter
      Bar.new
    end

    private_dependancy :bar5 do
      Bar.new
    end

    dependancy :bar6

    def self.counter
      @count ||= 0
      @count += 1
    end

    def self.count
      @count
    end
  end

  let(:foo) { Foo.new }

  it '._dependancies' do
    Foo._dependancies.should have(6).items
  end

  it 'dependancy have default value' do
    foo.bar1.should be_a Bar
  end

  it 'dependancy could access current object' do
    bar = foo.bar2
    bar.name.should == 'foo name'
  end

  it 'assign a new dependancy' do
    old_bar = foo.bar1
    foo.bar1 = Bar.new

    foo.bar1.should_not == old_bar
  end

  it 'have nil value if there is error' do
    foo.bar3.should be_nil
  end

  it 'only eval dependancy block once' do
    foo.bar4
    foo.bar4.should be_a Bar

    foo.bar4 = 'stub'
    foo.bar4.should == 'stub'

    Foo.count.should == 1
  end

  it '.private_dependancy' do
    expect { foo.bar5 }.to raise_error NoMethodError
    foo.send(:bar5).should be_a Bar
  end
end
