require './ScalarFilter.rb'

class MaxFilter < ScalarFilter

  def initialize(n = nil)
    super(n)
  end

  def get_output(input)
    super(input){|arr| arr.max}
  end

end