# Feedback filters have outputs dependent on their previous outputs, so outputs are stored in a separate array
require './filters/Filter.rb'

class FeedbackFilter < Filter

	attr_accessor :outputs

	def initialize
		#used to track outputs to feed back into the filter
		@outputs = []
		super()
	end

	def get_output(input)
		raise "Vectors not supported for Feedback Filters" if input.is_a? Array
		super(input)
	end

end