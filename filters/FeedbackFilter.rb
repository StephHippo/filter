# Feedback filters have outputs dependent on their previous outputs, so outputs are stored in a separate array
require './filters/Filter.rb'

class FeedbackFilter < Filter

	attr_accessor :outputs

	def initialize
		@outputs = []
		super()
	end

end