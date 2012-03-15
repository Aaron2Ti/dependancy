require "dependancy/version"

module Dependancy
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
        var_name = "@#{name}"

        if instance_variable_defined?(var_name)
          instance_variable_get(var_name)

        else
          val = begin
                  yield self
                rescue
                  nil
                end

          instance_variable_set var_name, val

          val
        end
      end # define_method name do
    end
  end

  def private_dependancy(name, &block)
    dependancy name, &block

    private name
    private "#{name}="
  end
end
