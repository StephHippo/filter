# MinFilters operate independently of their outputs
# For filters that have no n constraint, inputs do not need stored

require './filters/Filter.rb'
require './Resettable.rb'

class MinFilter < Filter

	include Resettable

	attr_accessor :min

  def initialize(n = nil)
    operation = lambda{|arr| arr.min}
    super(n, &operation)
		@min = nil
	end

	# Given an n constraint, gets output like a standard filter
	# If no constraint, calculates without using inputs
	def get_output(input)
		if @n then
			super(input)
		else
			if @min == nil || input < @min
				@min = input
			else
				@min
			end
		end
	end

	# Clears either the min or the inputs
	def reset
		@n ? @inputs = [] : @min = 0
	end
end