class Filter

  #repeatedly takes an input value
  #produces an output value
  attr_accessor :outputs, :inputs

  def initialize(n = nil, &operation)
    @inputs = []
    @outputs = []
    @n = n
    @operation = operation
  end

  # appends to inputs
  def input_value(input)
    #append input to inputs
    @inputs << input
  end

  # calculate output and return latest output
  # TODO: Update to use a proc?
  def get_output(input)
    raise "Not a Number" unless (input.is_a? Fixnum)
    #append input
    input_value(input)
    #caluclate output and append to outputs
    @outputs << @operation.call(relevant_values)
    #return latest outputs
    @outputs.last
  end

  private

  #returns relevant values for computation
  def relevant_values
    if @n && @n < @inputs.length
      #calculate on just the last n values
      @inputs[(@inputs.length - @n)..@inputs.length]
    else
      #calculate on all values
      @inputs
    end
  end
end