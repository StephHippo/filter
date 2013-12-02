require './filters/GainFilter.rb'
require './Resettable.rb'

class GainFilter < FIRFilter
	include Resettable

	def initialize(gain)
      super([gain])
  end

end