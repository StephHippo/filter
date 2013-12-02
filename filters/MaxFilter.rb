require './filters/Filter.rb'

class MaxFilter < Filter
	include Resettable

	attr_accessor :max

	def initialize(n = nil)
    operation = lambda{|arr| arr.max}
    super(n, &operation)
		@max = nil
	end

	# Given an n constraint, gets output like a standard filter
	# If no constraint, calculates without using inputs
	def get_output(input)
		if @n then
			super(input)
		else
			if @max.nil? || (input > @max) then
				@max = input
			else
				@max
			end
		end
	end

	# clears either the max or the inputs
	def reset
		@n ? @inputs = [] : @max = 0
	end

end