require './FIRFilter.rb'

describe 'FIRFilters' do
  before (:each) do
    @fir = FIRFilter.new([2])

  end

  it 'should always output the input multiplied by a constant factor' do
    @fir.get_output(2).should eq 4
    @fir.get_output(3).should eq 6
    @fir.get_output(5).should eq 10
  end

  it 'should raise an error if the input is not a number' do
    lambda{@fir.get_output(Object.new)}.should raise_error
  end

end