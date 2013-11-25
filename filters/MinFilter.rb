require './filters/ResettableFilter.rb'
class MinFilter < ResettableFilter

  def initialize(n = nil)
    operation = lambda{|arr| arr.min}
    super(n, &operation)
  end

end