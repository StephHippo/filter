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
    puts "\t0"
    reset_in_val.nil? ? @inputs = [] : @inputs.map! { |input| input = reset_in_val }
    reset_out_val.nil? ? @outputs = [] : @outputs.map! { |output| output = reset_out_val }
  end

  def input_value(input)
    @inputs << input
  end

  def print_table
    puts "\nInputs \t Reset \t Outputs"
    #for each input, put the output
    @inputs.each_with_index do |input, i|
      puts "#{input} \t \t \t #{@outputs[i]}"
    end
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