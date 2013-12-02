# Binomial Filter is a filter with no output parameters with variable output parameters
# Output parameters vary by the number of input params, N. b_i = NCi
require './filters/FIRFilter.rb'
require './Fixnum.rb'

class BinomialFilter < FIRFilter
	include Resettable

	@@factorial_cache = Hash.new

  def initialize(p)
    super([])
    @p = p.to_i
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
		if (i > @p)
			return 1
		#if the cache doesn't have the key, add the calculation
		elsif !(@binomial_cache.has_key? i)
			num = check_factorial_cache(@p)
			denom1 = check_factorial_cache(@p-i)
			denom2 = check_factorial_cache(i)
			@binomial_cache[i] = num/(denom1*denom2)
		end
		@binomial_cache[i]
	end

	def check_factorial_cache(key)
		if (@@factorial_cache.has_key? key) then
			@@factorial_cache[key]
		else
			@@factorial_cache[key] = key.factorial
		end
	end
end