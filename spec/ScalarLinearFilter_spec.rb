require './filters/ScalarLinearFilter.rb'

describe 'ScalarLinearFilter' do
  before(:each) do
    @sl = ScalarLinearFilter.new([0.5,0.5], [0.1])
  end

	describe 'reset' do
		# GOOD DATA
		context 'given a valid value r' do
			it 'should reset input and output values' do
				@sl.get_output(-1.0).should eq(-0.5)
				@sl.get_output(1.0).should eq(0.05)
				@sl.get_output(2.0).should eq(1.495)
				@sl.reset(5.0)
				@sl.inputs.each do |input|
					input.should eq 5
				end
				@sl.outputs.each do |output|
					output.should eq (5.0 * 1.0)/(1.0 + 0.1)
				end
			end
		end

		# BAD DATA
		context 'given an r value that is not a number' do
			it 'should raise an error' do
				lambda{@sl.reset(Object.new)}.should raise_error
			end
		end
	end

	describe 'get_output' do
  	# BAD DATA
		it 'should give scalar linear output' do
  	  @sl.get_output(-1).should eq(-0.5)
  	  @sl.get_output(1).should eq(0.05)
    	@sl.get_output(2).should eq(1.495)
  	end

  	# GOOD DATA
  	it 'should assert that the inputs must be numbers' do
    	lambda{@sl.get_output(Object.new)}.should raise_error
		end
	end

	#TODO: Private tests
	describe 'validate_param' do

	end

	describe 'get_last_z_values' do

	end
end