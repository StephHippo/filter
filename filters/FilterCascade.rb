require './filters/Filter.rb'

class FilterCascade < Filter

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
  def cascade(input)
    cascade_input = input
    #use output of previous filter as input of current filter
    @filters.each do |filter|
      cascade_input = filter.get_output(cascade_input)
    end
    cascade_input
  end
end