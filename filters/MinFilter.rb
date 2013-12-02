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

	def reset
		@n ? @inputs = [] : @min = 0
	end
end