require './ScalarFilter.rb'
class ArithmeticMeanFilter < ScalarFilter

  def get_mean(input)
    get_output(input){|arr| average(arr)}

  end

  private

  def average(arr)
    arr.inject(:+)/arr.length
  end

end