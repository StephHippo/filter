class Filter

  #repeatedly takes an input value
  #produces an output value

  def initialize
    @inputs = []
    @outputs = []
  end

  def reset(reset_in_val = 0, reset_out_val = 0)
    #print inputs and outputs to be discarded
    print_table unless @inputs.is_empty?
    @inputs.map!{|input| input = reset_in_val}
    @outputs.map!{|output| output = reset_out_val}
  end

  def input_value(input)
    @inputs << input
  end

  def print_table
    puts "Inputs  \t  Outputs"
    #for each input, put the output
    @inputs.each_with_index do |input, i|
      puts "#{input} \t #{@outputs[i]}"
    end
  end

end