require './filters/Filter.rb'

class ResettableFilter < Filter

  #resets values of input and input
  def reset(reset_in_val = nil, reset_out_val = nil)
    #reset input values to an empty array unless given a reset value
    reset_in_val.nil? ? @inputs = [] : @inputs.map! { |input| input = reset_in_val }
    #reset output values to an empty array unless given a reset value
    reset_out_val.nil? ? @outputs = [] : @outputs.map! { |output| output = reset_out_val }
  end

end