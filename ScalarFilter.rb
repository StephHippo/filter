require './ScalarFilter.rb'

class ScalarFilter < Filter

  def initialize(n = nil)
    super.initialize
    @n
  end

  def reset
    @inputs = []
    @outputs = []
  end

  def get_output(input)
    input_value(input)
    @outputs << super.output{|arr| yield arr}
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