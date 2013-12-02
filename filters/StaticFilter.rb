require './filters/Filter.rb'

class StaticFilter < Filter

	def get_output(input)
		#append input
		input_value(input)
		#caluclate output and append to outputs
		@operation.call(relevant_values)
	end

end