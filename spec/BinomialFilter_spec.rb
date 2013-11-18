require './BinomialFilter.rb'

describe 'BinomialFilter' do
  before(:each) do
    @binomial = BinomialFilter.new(2)
  end

  it 'should return the input multiplied by nCi each time' do
    @binomial.get_output(2).should eq 4
  end

end