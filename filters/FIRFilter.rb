# FIR Filters act like ScalarLinearFilters, except all output params are 0 (empty)
# FIR Filters are considered resettable

require './filters/ScalarLinearFilter.rb'
require './Resettable.rb'

class FIRFilter < ScalarLinearFilter
	include Resettable

	def initialize(inputparams)
    super(inputparams, [])
  end

end