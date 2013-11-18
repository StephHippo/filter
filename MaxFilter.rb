require './ScalarFilter.rb'

class MaxFilter < ScalarFilter

  def initialize(n = nil)
    super(n)
  end

  def get_max(input)
    get_output(input){|arr| arr.max}
  end

end