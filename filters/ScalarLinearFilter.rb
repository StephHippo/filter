# Scalar Linear Filter finds the yi output using the equation:
# y_i + (a_i)(y_i-1) + (a_2)(y_i-2) + ... + (a_m)(y_i-M) = b_0(x_i) + b_i(x_i-1) + b_2(x_i-2) + ... + (b_N)(x_i-N)
# Where N is the number of input filters
# And M is the number of output filters

require './filters/FeedbackFilter.rb'
require './Resettable.rb'
class ScalarLinearFilter < FeedbackFilter
	include Resettable

	def initialize(inputparams, outputparams)
    super()
    @input_parameters = inputparams
    @output_parameters = outputparams
  end

  # Reset the input values to r
	# Reset the output values to (r * sum(i=0,N)inputparams)/(1 + sum(i=1,M)outputparams)
  def reset(r)
		raise "r is not a number" unless ((r.is_a? Fixnum) || (r.is_a? Float))
    #sum the input parameters
    input_parameters_sum = @input_parameters.inject(:+) || 0
    #sum the output parameters
    output_parameters_sum = @output_parameters.inject(:+) || 0
    #calculate output reset value = (r * sum(i=0,N)inputparams)/(1 + sum(i=1,M)outputparams)
    output_reset = (r * input_parameters_sum) / (1.0 + output_parameters_sum)
    #pass values to super
		@inputs = super({:reset_val => r, :arr => @inputs})
		@outputs = super({:reset_val => output_reset, :arr => @outputs})
  end

  # Multiplies the inputs and outputs by their respective parameters to get the new output
  def get_output(input)
    raise "Input is not a number" unless ((input.is_a? Fixnum) || (input.is_a? Float))
    #add to input
    input_value(input)

    n = @input_parameters.length
    inputs = get_last_z_values(n, @inputs)

    m = @output_parameters.length
    outputs = get_last_z_values(m, @outputs)

    #solve for yi by subtracting multiplied values from right hand side
    output =  multiply_each_by_param(inputs, @input_parameters) - multiply_each_by_param(outputs, @output_parameters)
    @outputs << output
    @outputs.last
  end

  private

  # multiplies each input/output by its corresponding parameter
	def multiply_each_by_param(arr, params_arr)
    total = 0.0
    #multiply each value by its corresponding parameter and add to total
    params_arr.each_with_index do |param, i|
			total += (arr[i] * param) unless arr[i].nil?
		end
    total
  end

  # retrieves the latest z values of an input or output
  # if there are not enough parameters, it fills the empty values with 0
  def get_last_z_values(z, value_array)
    arr = value_array
    #if there will be missing output params
    if arr.length < z
      # values are appended, not prepended so array is returned in reverse order
      arr.reverse
		else
      arr.reverse[0...z]
    end
  end

end