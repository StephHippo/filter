require './Filter.rb'
class MinFilter < Filter

  def initialize(n = nil)
    super(n)
  end

  # Find the min
  def get_output(input)
    super(input){|arr| arr.min}
  end

end