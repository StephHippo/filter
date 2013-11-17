require './Filter.rb'

class MaxFilter < Filter

  def initialize(n = nil)
    @n = n
  end

  def get_max(input)
    output = 0
    if @n
      output = @inputs[(@inputs.length - @n).. @inputs.length]
    else
      output << @inputs.max
    end
    @outputs << output
    output
  end

end