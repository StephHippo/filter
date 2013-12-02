require './filters/MinFilter.rb'

describe 'MinFilter' do
  before(:each) do
    @min = MinFilter.new
		@minn = MinFilter.new(3)
  end

	describe 'get_output' do
		# STRUCTURED BASIS
		# GOOD DATA
		context 'given no n value' do
			it 'should find the max of a series of inputs' do
				@min.get_output(5).should be 5
				@min.get_output(1).should be 1
				@min.get_output(7).should be 1
				@min.get_output(-1).should be -1
			end
		end

		# STRUCTURED BASIS
		# GOOD DATA
		context 'given an n value' do
			it 'should find the max of a series of inputs' do
				@minn.get_output(5).should be 5
				@minn.get_output(1).should be 1
				@minn.get_output(7).should be 1
				@minn.get_output(-1).should be -1
			end
		end

		context 'given a nil min' do
			it 'should assign the first input as the new min' do
				@min.get_output(1)
				@min.min.should eq 1
			end
		end

		# BAD DATA
		context 'given an input that is not a number' do
			it 'should assert that the inputs must be numbers' do
				lambda{@min.get_min(Object.new)}.should raise_error
			end
		end
	end

	describe 'reset' do
		# STRUCTURED BASIS
		context 'given an n value' do
			it 'should empty the input array' do
				@minn.get_output(1).should be 1
				@minn.get_output(5).should be 1
				@minn.get_output(7).should be 1
				@minn.get_output(0).should be 0
				@minn.reset()
				@minn.inputs.should eq []
			end
		end

		# STRUCTURED BASIS
		context 'given no n value' do
			it 'should reset the max to 0' do
				@min.get_output(5)
				@min.get_output(5)
				@min.get_output(7)
				@min.get_output(3)
				@min.reset()
				@min.min.should eq 0
			end
		end
	end

	# STRESS TEST
	context 'given a large amount of input values' do
		it 'should find the min without running out of memory' do
			100000000.times do
				out = rand(10000000)
				@min.get_output(out)
			end
		end
	end
end