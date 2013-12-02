require './filters/FIRFilter.rb'
require './Fixnum.rb'

class BinomialFilter < FIRFilter


  def initialize(n)
    super([])
    @n = n.to_i
		@binomial_cache = Hash.new
	end

  def get_output(input)
    update_input_params
    super(input)
  end

  private

  def update_input_params
    #get the number of outputs, adding 1 to account for the output being calculated
    @input_parameters << binomial_value
  end

  #calculate the binomial from the factorials
  #nCk = n!/((n-k)!k!)
  def binomial_value
    i = @outputs.length + 1
    #if i is greater than n, the binomial is 1
		if (i > @n)
			1
		elsif @binomial_cache.has_key? i
			@binomial_cache[i]
		else
			@binomial_cache[i] = @n.factorial/((@n-i).factorial * (i).factorial)
			@binomial_cache[i]
		end
  end
end