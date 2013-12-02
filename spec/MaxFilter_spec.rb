require './filters/MaxFilter.rb'

describe 'MaxFilter' do
  before(:each) do
    @max = MaxFilter.new
		@maxn = MaxFilter.new(3)
  end

	describe 'get_output' do
		# GOOD DATA
		# STRUCTURED BASIS
		context 'given valid inputs' do
			it 'should find the max of a series of inputs' do
				@max.get_output(5).should be 5
				@max.get_output(5).should be 5
				@max.get_output(7).should be 7
				@max.get_output(3).should be 7
			end
		end

		# GOOD DATA
		# STRUCTURED BASIS
		context 'given valid inputs' do
			it 'should find the max of a series of inputs' do
				@maxn.get_output(9).should be 9
				@maxn.get_output(5).should be 9
				@maxn.get_output(7).should be 9
				@maxn.get_output(3).should be 7
			end
		end

		# BAD DATA
		context 'given something that is not a number' do
			it 'should assert that the inputs must be numbers' do
				lambda{@max.get_max(Object.new)}.should raise_error
			end
		end
	end

	describe 'reset' do
		# STRUCTURED BASIS
		context 'given an n value' do
			it 'should empty the input array' do
				@maxn.get_output(9).should be 9
				@maxn.get_output(5).should be 9
				@maxn.get_output(7).should be 9
				@maxn.get_output(3).should be 7
				@maxn.reset()
				@maxn.inputs.should eq []
			end
		end

		# STRUCTURED BASIS
		context 'given no n value' do
			it 'should reset the max to 0' do
				@max.get_output(5)
				@max.get_output(5)
				@max.get_output(7)
				@max.get_output(3)
				@max.reset()
				@max.max.should eq 0
			end
		end
	end
end