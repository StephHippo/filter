require './Filter.rb'

class MaxFilter < ScalarFilter

  def get_max(input)
    get_output(input){|arr| arr.max}
  end

end