require './filters/MinFilter.rb'

describe 'MinFilter' do
  before(:each) do
    @min = MinFilter.new
  end

	context 'given valid inputs' do
  	it 'should find the max of a series of inputs' do
    	@min.get_output(5).should be 5
    	@min.get_output(1).should be 1
    	@min.get_output(7).should be 1
    	@min.get_output(-1).should be -1
		end
	end

	context 'given an input that is not a number' do
  	it 'should assert that the inputs must be numbers' do
    	lambda{@min.get_min(Object.new)}.should raise_error
		end
	end

end