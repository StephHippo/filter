class Filter

  #repeatedly takes an input value
  #produces an output value

  def initialize
    @inputs = []
    @outputs = []
  end

  #TODO: Use an options hash?
  def reset(reset_in_val = 0, reset_out_val = 0)
    #print inputs and outputs to be discarded
    to_s
    @inputs.map!{|input| input = reset_in_val}
    @outputs.map!{|output| output = reset_out_val}
  end

  #TODO: Opportunity to refactor last 3 lines
  #TODO: Best way to handle?
  #takes an input, gives an output
  def function(input, n = @inputs.length)
    @inputs << input
    if block_given?
      output = yield input
    else
      output = input
    end
    @outputs << output
    output
  end

  def input_value(input)
    @inputs << input
  end

  def to_s
    puts "Inputs  \t  Outputs"
    #TODO: If we decide to support archived inputs, add functionality here
    #for each input, put the output
    @inputs.each_with_index do |input, i|
      puts "#{input} \t #{@outputs[i]}"
    end
  end

end