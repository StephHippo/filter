require 'simplecov'
SimpleCov.start
require './filters/Filter.rb'
require './publicize.rb'

describe Filter do
	before(:each)do
		operation = lambda{|arr| arr.last}
		@fil = Filter.new(&operation)
		@filn = Filter.new(2, &operation)
	end

	describe "input_value" do
		#GOOD DATA
		context 'given a good input value with no n value' do
			it 'should append the input value to the inputs array' do
				@fil.input_value(3).should eq [3]
				@fil.input_value(4).should eq [3,4]
				@fil.input_value(5).should eq [3,4,5]
			end
		end

		#GOOD DATA
		context 'given a good input value with an n value' do
			it 'should append the input value to the inputs array' do
				@filn.input_value(3).should eq [3]
				@filn.input_value(4).should eq [3,4]
				@filn.input_value(5).should eq [3,4,5]
			end
		end

		#BAD DATA
		context 'given a bad input value with no n value' do
			it 'should raise an error' do
				lambda{@fil.input_value(Object.new)}.should raise_error
			end
		end

		#BAD DATA
		context 'given a bad input value with an n value' do
			it 'should raise an error' do
				lambda{@filn.input_value(Object.new)}.should raise_error
			end
		end
	end

	describe "get_output" do
		#GOOD DATA
		context 'given a good input value with no n value' do
			it 'should return the output based on the operation' do
				@fil.get_output(2).should eq 2
				@fil.get_output(3).should eq 3
			end
		end


		#GOOD DATA
		context 'given a good input value with an n value' do
			it 'should return the output based on the operation' do
				@filn.get_output(2).should eq 2
				@filn.get_output(3).should eq 3
				@filn.get_output(5).should eq 5
			end
		end

		#BAD DATA
		context 'given a bad input value with no n value' do
			it 'should raise an error' do
				lambda{@fil.get_output(Object.new)}.should raise_error
			end
		end

		#BAD DATA
		context 'given a bad input value with an n value' do
			it 'should raise an error' do
				lambda{@filn.get_output(Object.new)}.should raise_error
			end
		end
	end

	describe "relevant_values" do
		#STRUCTURED BASIS
		#CONDITIONAL AND IS TRUE (N is > 0)
		context 'given a pre-loaded input array with less than n values' do
			it 'should return the whole input array' do
				@filn.input_value(3)
				Filter.publicize(:relevant_values) do
						@filn.relevant_values.should eq ([3])
				end
			end
		end

		#STRUCTURED BASIS
		context 'given a pre-loaded input array with n values' do
		  it 'should return the whole array' do
				@filn.input_value(3)
				@filn.input_value(5)
				Filter.publicize(:relevant_values) do
					@filn.relevant_values.should eq (@filn.inputs)
				end
			end
		end

		#STRUCTURED BASIS
		#CONDITIONAL AND IS FALSE (N is nil)
		context 'given a pre-loaded input array with greater than n values' do
		  it 'should return the last n inputs' do
				@filn.input_value(3)
				@filn.input_value(5)
				@filn.input_value(7)
				Filter.publicize(:relevant_values) do
					@filn.relevant_values.should eq ([5,7])
				end
			end
		end

		#BAD DATA: N is Not a Number
		context 'given an n that is not an integer' do
			  it 'should raise an error' do
					operation = lambda{|arr| arr.last}
					@filbad = Filter.new("abc", &operation)
					Filter.publicize(:relevant_values) do
						lambda{@filbad.relevant_values}.should raise_error
					end
				end
		end
	end

end