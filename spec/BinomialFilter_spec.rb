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


		# STRUCTURED BASIS
		context 'given an i less than or equal to P that has not been seen before by the binomial cache' do
			it 'should check the factorial cache and calculate the new binomial value' do
				puts "Test of interest"
				@binomial3 = BinomialFilter.new(5)
				@binomial3.get_output(3)
				@binomial2 = BinomialFilter.new(3)
				BinomialFilter.publicize(:binomial_value) do
					@binomial2.should_receive(:check_factorial_cache)
					@binomial2.binomial_value
				end
			end
		end

		# STRUCTURED BASIS
		context 'given an i less than or equal to P that has been seen before by another binomial filter' do
			it 'should return the cached value' do
				@binomial4 = BinomialFilter.new(3)
				@binomial4.get_output(1)
				BinomialFilter.publicize(:binomial_value) do
					@binomial4.should_receive(:check_factorial_cache).exactly(0).times
					@binomial4.binomial_value.should
				end
			end
		end
	end
end