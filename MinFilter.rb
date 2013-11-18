require './ScalarFilter.rb'
class MinFilter < ScalarFilter

  #TODO: Refactor out code to Scalar Filter
  def get_output(input)
    super(input){|arr| arr.min}
  end

end