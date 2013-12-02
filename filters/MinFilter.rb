require './filters/StaticFilter.rb'
require './Resettable.rb'

class MinFilter < StaticFilter

	include Resettable

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
end