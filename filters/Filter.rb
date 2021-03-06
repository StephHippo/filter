# Filters are assumed to be unresettable and static (non-feedback) unless stated otherwise
# All filters can take an optional n constraint
class Filter

  #repeatedly takes an input value
  #produces an output value
  attr_accessor :inputs

  def initialize(n = nil, &operation)
    @inputs = []
    @n = n
    @operation = operation
  end

  # appends input to inputs
  def input_value(input)
		raise "Not a valid Numerical Input" unless (input.is_a?(Fixnum) || input.is_a?(Float) || input.is_a?(Array))
		#append input to inputs
    @inputs << input
  end

  # calculate output and return latest output
  def get_output(input)
    #append input
    input_value(input)
    #caluclate output and append to outputs
    output = @operation.call(relevant_values)
  end

  private

  #returns relevant values for @n dependent filters or all values for independent filters
  def relevant_values
		raise "N is not an integer" unless ((@n.nil?) || (@n.is_a? Fixnum))
    if @n && @n < @inputs.length
      #calculate on just the last n values
      @inputs[(@inputs.length - @n)..@inputs.length]
    else
      #calculate on all values
      @inputs
    end
  end
end