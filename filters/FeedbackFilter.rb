require './filters/Filter.rb'

class FeedbackFilter < Filter

	attr_accessor :outputs

	def initialize
		@outputs = []
		super()
	end

end