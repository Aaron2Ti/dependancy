module Dependancy
  module Bild
    module ClassMethods
      def bild(dependancies = {})
        Bild.bild self, dependancies
      end
    end

    #
    # class Foo
    #   dependancy :bar
    # end
    #
    # class Bar
    # end
    #
    # bar = Bar.new
    #
    # include Dependancies::Bild
    # foo = bild Foo, bar: bar
    #
    def bild(klass, dependancies = {})
      obj = klass.new

      dependancies.each do |k, v|
        obj.send "#{k}=", v
      end

      obj
    end

    extend self
  end
end
