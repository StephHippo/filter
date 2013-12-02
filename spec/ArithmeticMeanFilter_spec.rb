require 'simplecov'
SimpleCov.start
require './filters/ArithmeticMeanFilter.rb'
require './publicize.rb'

describe 'ArithmeticMeanFilter' do
  before(:each) do
    @mean = ArithmeticMeanFilter.new
		@meann = ArithmeticMeanFilter.new(4)
  end

	describe 'get_output' do
		# GOOD DATA
		# STRUCTURED BASIS
  	it 'should find the mean of a series of inputs' do
    	@mean.get_output(5).should eq 5.0
    	@mean.get_output(5).should eq 5.0
    	@mean.get_output(11).should eq 7.0
    	@mean.get_output(3).should eq 6.0
  	end

		# BAD DATA
		# STRUCTURED BASIS
  	it 'should assert that the inputs must be numbers' do
    	lambda{@mean.get_output(Object.new)}.should raise_error
  	end
	end

	describe 'reset' do

		# STRUCTURED BASIS
		context 'given an n value' do
			it 'should discard previous data after reset' do
				@meann.get_output(3).should eq 3.0
				@meann.get_output(5).should eq 4.0
				@meann.get_output(7).should eq 5.0
				@meann.get_output(9).should eq 6.0
				@meann.get_output(12.0).should eq 8.25
				@meann.reset()
				@meann.get_output(2.0).should eq 2.0
				@meann.get_output(6.0).should eq 4.0
			end
		end

		# STRUCTURED BASIS
		context 'given no n value' do
			it 'should discard previous data after reset' do
				@mean.get_output(5).should eq 5.0
				@mean.get_output(5).should eq 5.0
				@mean.get_output(11).should eq 7.0
				@mean.get_output(3).should eq 6.0
				@mean.reset()
				@mean.get_output(2).should eq 2.0
				@mean.get_output(6).should eq 4.0
			end
		end

	end

	#GOOD DATA
	describe "average" do
		context 'given an array of integers' do
			it 'it should return the average from a series of inputs' do
				ArithmeticMeanFilter.publicize(:average) do
					@mean.average([0,10,20]).should eq 10
				end
			end
		end

		#BAD DATA
		context 'given an array of non-numbers' do
			it 'should raise an error' do
				ArithmeticMeanFilter.publicize(:average) do
					lambda{@mean.average([Object.new, Object.new, Object.new])}.should raise_error
			  end
			end
		end
	end

	# STRESS TEST
	context 'given a large amount of valid input values' do
		it 'should continue calculating' do
			100000000.times do
				out = rand(10000000)
				@mean.get_output(out)
			end
		end
	end
end