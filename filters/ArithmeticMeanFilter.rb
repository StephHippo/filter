#ArithmeticMean Filter finds the average of all (or the last n) inputs
require './filters/StaticFilter.rb'
require './Resettable.rb'

class ArithmeticMeanFilter < StaticFilter

	include Resettable

	def initialize(n = nil)
    operation = lambda{|arr| average(arr) }
    super(n, &operation)
		@total = 0
		@i = 0
  end

	def get_output(input)
		if @n
			super(input)
		else
			@total += input
			@i += 1.0
			@total/@i
		end
	end

	def reset(params = {})
		if @n
			super(params = {})
		else
			@total = 0
			@i = 0
		end
	end

  private

  def average(arr)
			arr.inject(:+)/arr.length
  end

end