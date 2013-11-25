require './filters/ResettableFilter.rb'

class MaxFilter < ResettableFilter

  def initialize(n = nil)
    operation = lambda{|arr| arr.max}
    super(n, &operation)
  end

end