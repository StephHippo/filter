require './filters/ScalarLinearFilter.rb'
require './Resettable.rb'
class FIRFilter < ScalarLinearFilter
	include Resettable

	def initialize(inputparams)
    super(inputparams, [])
  end

end