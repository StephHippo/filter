require './filters/BinomialFilter.rb'

describe 'BinomialFilter' do
  before(:each) do
    @binomial = BinomialFilter.new(3)
  end

  #Good Data
  it 'should return the sum of each input multiplied by nCi' do
    @binomial.get_output(2).should eq 2*3
    @binomial.get_output(3).should eq 2*3+3*3
		@binomial.get_output(4).should eq 4*3+3*3+2*1
  end

  #Bad Data
  it 'should raise an error if the input is not a number' do
    lambda{@binomial.get_output(Object.new)}.should raise_error
  end
end