require './filters/MinFilter.rb'

describe 'MinFilter' do
  before(:each) do
    @min = MinFilter.new
		@minn = MinFilter.new(3)
  end

	context 'given no n value' do
		# STRUCTURED BASIS
		# GOOD DATA
  	it 'should find the max of a series of inputs' do
    	@min.get_output(5).should be 5
    	@min.get_output(1).should be 1
    	@min.get_output(7).should be 1
    	@min.get_output(-1).should be -1
		end
	end

	context 'given an n value' do
		# STRUCTURED BASIS
		# GOOD DATA
		it 'should find the max of a series of inputs' do
			@minn.get_output(5).should be 5
			@minn.get_output(1).should be 1
			@minn.get_output(7).should be 1
			@minn.get_output(-1).should be -1
		end
	end

	context 'given an input that is not a number' do
		# BAD DATA
  	it 'should assert that the inputs must be numbers' do
    	lambda{@min.get_min(Object.new)}.should raise_error
		end
	end

end