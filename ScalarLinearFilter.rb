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
    raise "Not a number" unless input.is_a? Fixnum
    #add to input
    input_value(input)

    #get count of output parameters
    n = @input_parameters.length
    #get the last n values of the input, using 0 as placeholder for underflow
    inputs = get_last_z_values(n){@inputs}
    #calculate numerator
    numerator = multiply_each_by_param(inputs){@input_parameters}

    #get count of output parameters
    m = @output_parameters.length
    #get the last n values of the output, using 0 as a placeholder for underflow
    outputs = get_last_z_values(m){@outputs}
    #calculate denominator
    denominator = multiply_each_by_param(outputs){@output_parameters}

    #if output is empty
    if @outputs.empty? || @output_parameters.empty?
      #there is no denominator, just return numerator
      @outputs << numerator
    else
      #divide
      #if denominator is 0, will return infinity as expected
      @outputs << numerator/denominator
    end
    #return latest output
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