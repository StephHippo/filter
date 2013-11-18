class Filter

  #repeatedly takes an input value
  #produces an output value
  attr_reader :n

  def initialize
    @inputs = []
    @outputs = []
  end

  #TODO: Use an options hash?
  def reset(reset_in_val = 0, reset_out_val = 0)
    #print inputs and outputs to be discarded
    to_s unless @inputs.is_empty?
    @inputs.map!{|input| input = reset_in_val}
    @outputs.map!{|output| output = reset_out_val}
  end

  def input_value(input)
    @inputs << input
  end

  def to_s
    puts "Inputs  \t  Outputs"
    #for each input, put the output
    @inputs.each_with_index do |input, i|
      puts "#{input} \t #{@outputs[i]}"
    end
  end

end