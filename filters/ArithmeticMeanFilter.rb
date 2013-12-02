#ArithmeticMean Filter finds the average of all (or the last n) inputs
require './filters/Filter.rb'
require './Resettable.rb'

class ArithmeticMeanFilter < Filter

	include Resettable

	def initialize(n = nil)
    operation = lambda{|arr| average(arr) }
    super(n, &operation)
		@total = 0
		@i = 0
  end

	# Operates as a memoryless filter unless an n if given
	def get_output(input)
		if @n
			super(input)
		else
			@total += input
			@i += 1.0
			@total/@i
		end
	end

	# Given an n, it resets the inputs
	def reset
		if @n
			@inputs = []
		else
			@total = 0
			@i = 0
		end
	end

  private

	# Sum all inputs and divide by the number of inputs
  def average(arr)
			arr.inject(:+)/arr.length
  end

end