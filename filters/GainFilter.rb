# Gain Filters are a type of Fir Filter in that they have no output parameters
# They have only a single, constant input parameter
require './filters/GainFilter.rb'
require './Resettable.rb'

class GainFilter < FIRFilter
	include Resettable

	def initialize(gain)
      super([gain])
  end

end