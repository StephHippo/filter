require 'simplecov'
SimpleCov.start
require './filters/FilterCascade.rb'
require './filters/MaxFilter.rb'
require './filters/MinFilter.rb'

describe 'FilterCascade' do
  before(:each) do
    @cascade = FilterCascade.new()
    @max = MaxFilter.new(2)
    @min = MinFilter.new(3)

  end

	describe 'add_filter' do
		#GOOD DATA
		context 'given a series of valid filters' do
			it 'should add the filter to the cascade order' do
				@cascade.add_filter(@max)
				@cascade.add_filter(@min)
				@cascade.filters.should eq [@max, @min]
			end
		end

	  context 'given an object that is not a filter' do
			it 'should raise an error' do
				lambda{@cascade.add_filter(Object.new)}.should raise_error
			end
		end
	end

	describe 'get_output' do
		#GOOD DATA
		context 'given valid inputs' do
			it 'should chain link all inputs and outputs' do
				@cascade.add_filter(@max)
				@cascade.add_filter(@min)
   	 		@cascade.get_output(-1).should be -1
    		@cascade.get_output(3).should be -1
    		@cascade.get_output(1).should be -1
    		@cascade.get_output(2).should be 2
    		@cascade.get_output(1).should be 2
			end
		end

		#STRUCTURED BASIS
		context 'given no filters' do
			it 'should raise an error' do
				lambda{@casade.get_output(2)}.should raise_error
			end
		end

		#BAD DATA
		context 'given an invalid input' do
			it 'should raise an error' do
				lambda{@cascade.get_output(Object.new)}.should raise_error
			end
		end
	end
end