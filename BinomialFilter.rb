require './FIRFilter.rb'
require './Fixnum.rb'
class BinomialFilter < FIRFilter

  def initialize(n)
    super([])
    @n = n.to_i
  end

  def get_output(input)
    update_input_params
    super(input)
  end

  private

  def update_input_params
    i = (@outputs.length + 1).to_i
    if i > @n
      b = 1
    else
      b = @n.factorial/((@n-i).to_i.factorial * (i).factorial)
    end
    @input_parameters << b
  end
end