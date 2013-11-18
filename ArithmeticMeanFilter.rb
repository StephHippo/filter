require './Filter.rb'
class ArithmeticMeanFilter < Filter

  def get_output(input)
    #update output with calculated average
    super(input){|arr| average(arr)}
  end

  private

  def average(arr)
    #calculate average
    arr.inject(:+)/arr.length
  end

end