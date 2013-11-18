require './Filter.rb'

class ScalarLinearFilter < Filter

  def initialize(inputparams, outputparams)
    super()
    @input_parameters = inputparams
    @output_parameters = outputparams
  end

  #reset values based on r
  def reset(r)
    #sum the input parameters
    input_parameters_sum = @input_parameters.inject(:+)
    #sum the output parameters
    output_parameters_sum = @output_parameters.inject(:+)
    #calculate output reset value = (r * sum(i=0,N)inputparams)/(1 + sum(i=1,M)outputparams)
    output_reset = (r * input_parameters_sum) / (1 + output_parameters_sum)
    #pass values to super
    super(r, output_reset)
  end

  # calculates the current output value based on params
  def get_output(input)
    raise "Not a number" unless input.is_a? Fixnum
    #add to input
    input_value(input)

    #get count of output parameters
    n = @input_parameters.length
    #get the last n values of the input, using 0 as placeholder for underflow
    inputs = get_last_z_values(n, @inputs)

    #get count of output parameters
    m = @output_parameters.length
    #get the last n values of the output, using 0 as a placeholder for underflow
    outputs = get_last_z_values(m, @outputs)

    #solve for yi by subtracting values by both sides
    output =  multiply_each_by_param(inputs, @input_parameters) - multiply_each_by_param(outputs, @output_parameters)
    #push output value onto @outputs array
    @outputs << output
    #return latest output
    @outputs.last
  end

  private

  #multiplies each input/output by its corresponding parameter
  def multiply_each_by_param(arr, params_arr)
    raise "Arrays must be of equal length" unless arr.length == params_arr.length
    total = 0
    #multiply each value by its corresponding parameter and add to total
    arr.each_with_index do |arr,i|
      total += arr*params_arr[i]
    end
    #return total
    total
  end

  #retrieves the latest z values of an input or output
  #if there are not enough parameters, it fills the empty values with 0
  def get_last_z_values(z, value_array)
    arr = value_array
    #if there will be missing output params
    if arr.length < z
      #get the parameters that are there
      arr = arr.reverse
      #fill in any gaps with 0's
      (z - arr.length).times{arr << 0}
    else
      #get the latest z values from the array
      arr = arr.reverse[0...z]
    end
    arr
  end

end