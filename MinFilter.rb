class MinFilter < Filter

  #TODO: Refactor out code to Filter or Scalar Filter
  def get_max(input)
    output = 0
    if @n
      output = @inputs[(@inputs.length - @n).. @inputs.length]
    else
      output << @inputs.min
    end
    @outputs << output
    output
  end

end