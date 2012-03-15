require "dependancy/version"

module Dependancy
 def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def _dependancies
      @_dependancies || []
    end

    def dependancy(name, &block)
      @_dependancies ||= []
      @_dependancies << name

      unless block_given?
        attr_accessor name

      else
        attr_writer name

        define_method name do
          begin
            yield self
          rescue
            nil
          end
        end
      end
    end
  end # module ClassMethods
end
