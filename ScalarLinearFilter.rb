require './ScalarFilter.rb'

class ScalarLinearFilter < ScalarFilter

  def initialize(inputparams, outputparams)
    super()
    @input_parameters = inputparams
    @output_parameters = outputparams
  end

  def reset(r)
    input_parameters_sum = @input_parameters.inject(:+)
    output_parameters_sum = @output_parameters.inject(:+)
    @inputs.map!{|input| input = r}
    @outputs.map!{|output| output = (r * output_parameters_sum) / (1 + input_parameters_sum)}
  end

  def get_output(input)
    input_value(input)
    n = @input_parameters.length
    inputs = get_last_z_values(n){@inputs}
    numerator = multiply_each_by_param(inputs){@input_parameters}


    m = @output_parameters.length
    outputs = get_last_z_values(m){@outputs}
    denominator = multiply_each_by_param(outputs){@output_parameters}

    #denominator = 0
    #outputs.each_with_index do |output,i|
    #  denominator += output*@output_parameters[i]
    #end
    #
    #numerator = 0
    #inputs.each_with_index do |input, i|
    #  numerator += input*@input_parameters[i]
    #end

    if @outputs.empty?
      @outputs << numerator
    else
      @outputs << numerator/denominator
    end

    @outputs.last
  end

  private

  def multiply_each_by_param(arr)
    total = 0
    temp = yield
    raise "Unequal arrays" unless (temp.length == arr.length)
    arr.each_with_index do |arr,i|
      total += arr*temp[i]
    end
    total
  end

  def get_last_z_values(z)
    arr = yield
    if arr.length < z
      arr = arr.reverse
      (z - arr.length).times{arr << 0}
    else
      arr = arr.reverse[0...z]
    end
    arr
  end

end