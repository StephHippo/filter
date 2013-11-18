class Filter

  #repeatedly takes an input value
  #produces an output value
  attr_accessor :outputs, :inputs

  def initialize(n = nil)
    @inputs = []
    @outputs = []
    @n = n
  end

  def reset(reset_in_val = nil, reset_out_val = nil)
    #print inputs and outputs to be discarded
    print_table unless @inputs.empty?
    #indicate reset occurred
    puts "\t0"
    #reset input values to an empty array unless given a reset value
    reset_in_val.nil? ? @inputs = [] : @inputs.map! { |input| input = reset_in_val }
    #reset output values to an empty array unless given a reset value
    reset_out_val.nil? ? @outputs = [] : @outputs.map! { |output| output = reset_out_val }
  end

  def input_value(input)
    #append input to inputs
    @inputs << input
  end

  def print_table
    puts "\nInputs \t Reset \t Outputs"
    #for each input, put the output
    @inputs.each_with_index do |input, i|
      puts "#{input} \t \t \t #{@outputs[i]}"
    end
  end

  def get_output(input)
    raise "Not a Number" unless (input.is_a? Fixnum)
    #append input
    input_value(input)
    #caluclate output and append to outputs
    @outputs << relevant_values{|arr| yield arr}
    #return latest outputs
    @outputs.last
  end

  private

  #returns relevant values for computation
  def relevant_values
    if @n && @n < @inputs.length
      #calculate on just the last n values
      yield @inputs[(@inputs.length - @n)..@inputs.length]
    else
      #calculate on all values
      yield @inputs
    end
  end
end