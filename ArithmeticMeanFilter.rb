require './Filter.rb'
class ArithmeticMeanFilter < Filter

  def get_output(input)
    super(input){|arr| average(arr)}
  end

  private

  def average(arr)
    arr.inject(:+)/arr.length
  end

end