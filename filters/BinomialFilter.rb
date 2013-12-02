# Binomial Filter is a filter with no output parameters with variable output parameters
# Output parameters vary by the number of input params, N. b_i = NCi
require './filters/FIRFilter.rb'
require './Fixnum.rb'

class BinomialFilter < FIRFilter
	include Resettable

	# stores values of previously calculated factorials and binomials to save on large calculations
	@@factorial_cache = Hash.new
	@@binomial_cache = Hash.new

	def initialize(p)
    super([])
    @P = p.to_i
	end

	# updates the new parameters before calculating the new output
	def get_output(input)
		@input_parameters << binomial_value
    super(input)
  end

  private

  #calculate the binomial from the factorials
  #nCk = n!/((n-i)!i!)
  def binomial_value
		i = @outputs.length + 1
    #if i is greater than n, the binomial is 1
		return 1 if (i > @P)
		#if the cache doesn't have the key, add the calculation
		if @@binomial_cache.has_key?("#{@P}Choose#{i}") ||  @@binomial_cache.has_key?("#{@P}Choose#{@P-i}")
			binomial = @@binomial_cache["#{@P}Choose#{i}"] || @@binomial_cache["#{@P}Choose#{@P-i}"]
			binomial
		else
			num = check_factorial_cache(@P)
			denom1 = check_factorial_cache(@P-i)
			denom2 = check_factorial_cache(i)
			@@binomial_cache["#{@P}Choose#{i}"] = num/(denom1*denom2)
			@@binomial_cache["#{@P}Choose#{@P-i}"] = num/(denom1*denom2)
		end
	end

	# Adds the factorial computation of the key if not already present
	def check_factorial_cache(key)
		if (@@factorial_cache.has_key? key)
			@@factorial_cache[key]
		else
			@@factorial_cache[key] = key.factorial
		end
	end
end