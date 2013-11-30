require './filters/Filter.rb'

class ResettableFilter < Filter

  #resets values of input and input
  #def reset(reset_in_val = nil, reset_out_val = nil)
  def reset(params = {})
		raise "reset_in_val is not a number" unless ((params[:reset_in_val].nil?) || (params[:reset_in_val].is_a? Fixnum))
		raise "reset_out_val is not a number" unless ((params[:reset_out_val].nil?) || (params[:reset_out_val].is_a? Fixnum))

		#reset input values to an empty array unless given a reset value
    params[:reset_in_val].nil? ? @inputs = [] : @inputs.map! { |input| input = params[:reset_in_val] }
    #reset output values to an empty array unless given a reset value
    params[:reset_out_val].nil? ? @outputs = [] : @outputs.map! { |output| output = params[:reset_out_val] }
  end

end