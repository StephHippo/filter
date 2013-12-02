require './filters/StaticFilter.rb'

class MaxFilter < StaticFilter
	include Resettable

	def initialize(n = nil)
    operation = lambda{|arr| arr.max}
    super(n, &operation)
		@max = 0
	end

	def get_output(input)
		if @n then
			super(input)
		else
			if (input > @max) then
				@max = input
			else
				@max
			end
		end
	end

end