require 'simplecov'
SimpleCov.start
require './filters/BinomialFilter.rb'
require './publicize.rb'


describe 'BinomialFilter' do
  before(:each) do
    @binomial = BinomialFilter.new(3)
  end

	describe 'get_output' do
 	 	#Good Data
		context 'given good data' do
			it 'should return the sum of each input multiplied by nCi' do
				@binomial.get_output(2).should eq 2*3
				@binomial.get_output(3).should eq 2*3+3*3
				@binomial.get_output(4).should eq 4*3+3*3+2*1
			end
		end

  	#Bad Data
		context 'given bad data' do
			it 'should raise an error if the input is not a number' do
				lambda{@binomial.get_output(Object.new)}.should raise_error
			end
		end
	end

	describe 'binomial_value' do

		# STRUCTURED BASIS
		context 'given no inputs' do
		  it 'should find the binomial value of the first parameter' do
				BinomialFilter.publicize(:binomial_value) do
					@binomial.binomial_value.should eq 3
				end
			end
		end


		context 'given an i greater than p' do
			# STRUCTURED BASIS
			it 'should return 1' do
				@binomial = BinomialFilter.new(0)
				BinomialFilter.publicize(:binomial_value) do
					@binomial.binomial_value.should eq 1
				end
			end
    end

		# STRUCTURED BASIS
		# EQUIVALENCE PARTITIONING
		context 'given an i less than or equal to P that has not been seen before by the binomial cache' do
			it 'should check the factorial cache and calculate the new binomial value' do
				#@binomial2 = BinomialFilter.new(32)
				BinomialFilter.publicize(:binomial_value) do
						@binomial.should_receive(:check_factorial_cache).exactly(3).times
						@binomial.binomial_value.should eq 3
				end
			end
		end

		# STRUCTURED BASIS
		# EQUIVALENCE PARTITIONING
		context 'given an i less than or equal to P that has been seen before by another binomial filter' do
			it 'should return the cached value' do
				@binomial.get_output(1)
				BinomialFilter.publicize(:binomial_value) do
					@binomial.should_receive(:check_factorial_cache).exactly(0).times
					@binomial.binomial_value
				end
			end
		end
	end

	describe 'check_factorial_cache' do
		# STRUCTURED BASIS
		context 'given a key already in the cache' do
			it 'should find the cached value of a previously calculated factorial' do
			  BinomialFilter.publicize(:check_factorial_cache) do
					@binomial.check_factorial_cache(3)

					@binomial.class_eval do
						cache = @binomial.class_variable_get(:factorial_cache)
						cache.has_key? 3
					end
				end
			end
		end

		context 'given a key not already in the cache' do
			it 'should add it to the cache' do

			end
		end
	end
end