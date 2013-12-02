
module Resettable

	def reset(params = {})
		validate_param(params[:reset_in_val])
		validate_param(params[:reset_out_val])

		#reset input values to an empty array unless given a reset value
		params[:reset_in_val].nil? ? @inputs = [] : @inputs.map! { |input| input = params[:reset_in_val] }
		#reset output values to an empty array unless given a reset value
		params[:reset_out_val].nil? ? @outputs = [] : @outputs.map! { |output| output = params[:reset_out_val] }
	end

	private

	def validate_param(param)
		raise "reset value is not a valid int or float number" unless (param.nil?) || (param.is_a? Fixnum) || (param.is_a? Float)
	end

end