require './ScalarFilter.rb'
class MinFilter < ScalarFilter

  #TODO: Refactor out code to Scalar Filter
  def get_min(input)
    get_output(input){|arr| arr.min}
  end

end