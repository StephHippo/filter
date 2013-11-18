require './Filter.rb'

class ScalarFilter < Filter

  def initialize(n = nil)
    super()
    @n = n
  end

  def reset
    @inputs = []
    @outputs = []
  end

  #TODO: Probably should move to Filter
  def get_output(input)
    raise "Not a Number" unless (input.is_a? Fixnum)
    input_value(input)
    @outputs << operate_on_inputs{|arr| yield arr}
    @outputs.last
  end

  private

  #TODO: Needs renamed
  def operate_on_inputs
    if @n && @n < @inputs.length
      #calculate on just the last n values
      output = yield @inputs[(@inputs.length - @n)..@inputs.length]
    else
      #calculate on all values
      output = yield @inputs
    end
    output
  end

end