require './filters/ResettableFilter.rb'

describe 'ResettableFilters' do
	before(:each)do
		sum = lambda{|arr| arr.inject(:+)}
		@resetfilter = ResettableFilter.new(4, &sum)
		@resetfilter.get_output(5)
		@resetfilter.get_output(6)
		@resetfilter.get_output(8)
		@resetfilter.get_output(9)
	end

	describe 'reset' do
		#GOOD DATA
		#STRUCTURED BASIS
		 context 'given no reset values' do
		 	it 'should clear the past inputs and continue to output' do
			 	@resetfilter.reset
			 	@resetfilter.outputs.should eq []
				@resetfilter.inputs.should eq []
			end
		 end

		 #GOOD DATA
		 #STRUCTURED BASIS
		context 'given a reset_in_val only' do
			it 'should reset the past inputs to the input value and continue to output' do
				@resetfilter.reset({:reset_in_val => 2})
				@resetfilter.inputs.should eq [2, 2, 2, 2]
			end
		end

		 #GOOD DATA
		 #STRUCTURED BASIS
		context 'given a reset_out_val only' do
			it 'should reset the past inputs to the input value and continue to output' do
				@resetfilter.reset({:reset_out_val=> 2})
				@resetfilter.outputs.should eq [2,2,2,2]
			end
		end

		 #GOOD DATA
		 #STRUCTURED BASIS
		context 'given both reset values' do
			it 'should reset the past inputs to the reset_in_val and the past outputs to the reset_out_val' do
				@resetfilter.reset({:reset_in_val=> 3, :reset_out_val => 2})
				@resetfilter.outputs.should eq [2,2,2,2]
			  @resetfilter.inputs.should eq [3,3,3,3]
			end
		end

		#BAD DATA
		context 'given bad reset values' do
			it 'should raise an error' do
				lambda{@resetfilter.reset({:reset_in_val=> Object.new, :reset_out_val => Object.new})}.should raise_error
			end
		end

	end

	describe 'validate_param' do

		# STRUCTURED BASIS
		# GOOD DATA
		context 'given an int or float' do
			it 'should not raise an error' do
				ResettableFilter.publicize(:validate_param) do
					@resetfilter.validate_param(0.5)
					@resetfilter.validate_param(1)
				end
			end
		end

		# STRUCTURED BASIS
		# GOOD DATA
		context 'given an invalid parameter' do
			it 'should raise an error' do
				ResettableFilter.publicize(:validate_param) do
					lambda{@resetfilter.validate_param(Object.new)}.should raise_error
				end
			end
		end
	end


end