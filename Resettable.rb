
module Resettable

	def reset(params = {:reset_val => 0, :arr => []})
		validate_params(params)
		#reset input values to an empty array unless given a reset value
		if params[:reset_val.nil?] || params[:arr].nil?
			[]
		else
			params[:arr].map! {|a| a = params[:reset_val]}
		end
	end

	private

	def validate_params(params = {})
		raise "Not a valid array" unless ((params[:arr].nil?) || (params[:arr].is_a? Array) )
		raise "Reset value is not a valid int or float number" unless (params[:reset_val].nil?) || (params[:reset_val].is_a? Fixnum) || (params[:reset_val].is_a? Float)
	end

end