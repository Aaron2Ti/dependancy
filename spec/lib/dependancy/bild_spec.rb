require 'spec_helper'
require 'dependancy'
require 'dependancy/bild'

describe Dependancy::Bild do
  class Bar
  end

  class Bild
  end

  class Foo2
    extend Dependancy

    dependancy :bar
    dependancy :bild
  end

  let(:bar) { Bar.new }

  it '#bild' do
    foo = Dependancy::Bild.bild(Foo2, bar: bar)
    foo.bar.should == bar
  end

  it 'Mixin .build' do
    foo = Foo2.bild bar: bar
    foo.bar.should == bar
  end
end
