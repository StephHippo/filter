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

  def get_output(input)
    raise "Not a Number" unless (input.is_a? Fixnum)
    input_value(input)
    @outputs << output{|arr| yield arr}
    @outputs.last
  end

  private

  def output
    if @n
      #calculate on just the last n values
      output = yield @inputs[(@inputs.length - @n).. @inputs.length]
    else
      #calculate on all values
      output = yield @inputs
    end
    @outputs << output
    output
  end

end