require './ScalarLinearFilter.rb'

class FIRFilter < ScalarLinearFilter

  def initialize(inputparams)
    super(inputparams, [])
  end

end