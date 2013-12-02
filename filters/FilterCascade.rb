# FilterCascade is an ordered collection of chain-linked filters where the output of one filter serves as the input of the next filter
require './filters/Filter.rb'

class FilterCascade < Filter

	attr_reader :filters

  def initialize
    super()
    @filters = []
  end

  # add a filter to the cascade order
  def add_filter(filter)
    raise "Not a filter" unless (filter.is_a? Filter)
    @filters << filter
  end

  #push input through all filters
  def get_output(input)
		raise "No filters added" if @filters.empty?
    cascade_input = input
    #use output of previous filter as input of current filter
    @filters.each do |filter|
      cascade_input = filter.get_output(cascade_input)
    end
    cascade_input
  end
end