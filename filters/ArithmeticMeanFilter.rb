require './filters/ResettableFilter.rb'
class ArithmeticMeanFilter < ResettableFilter

  def initialize(n = nil)
    operation = lambda{|arr| average(arr) }
    super(n, &operation)

  end

  private

  def average(arr)
    #calculate average
    arr.inject(:+)/arr.length
  end

end