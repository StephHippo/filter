require './ScalarLinearFilter.rb'

describe 'ScalarLinearFilter' do
  before(:each) do
    @sl = ScalarLinearFilter.new([0.5,0.5], [0.1])
  end

  it 'should give scalar linear output' do
    @sl.get_output(-1).should eq(-0.5)
    @sl.get_output(1).should eq(0.05)
    @sl.get_output(2).should eq(1.495)
  end

  it 'should reset and continue to output' do
    @sl.get_output(-1).should eq(-0.5)
    @sl.get_output(1).should eq(0.05)
    @sl.get_output(2).should eq(1.495)
    @sl.reset(0)
    @sl.get_output(-1).should eq(-0.5)
    @sl.get_output(3).should eq(1.05)
    @sl.get_output(1).should eq(1.895)
    @sl.get_output(2).should eq(1.3105)
    @sl.get_output(1).should eq(1.36895)
  end

  it 'should assert that the inputs must be numbers' do
    lambda{@sl.get_output(Object.new)}.should raise_error
  end
end