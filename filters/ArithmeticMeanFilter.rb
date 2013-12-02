#ArithmeticMean Filter finds the average of all (or the last n) inputs

require './filters/ResettableFilter.rb'
class ArithmeticMeanFilter < ResettableFilter

  def initialize(n = nil)
    operation = lambda{|arr| average(arr) }
    super(n, &operation)
  end

  private

  def average(arr)
    arr.inject(:+)/arr.length
  end

end