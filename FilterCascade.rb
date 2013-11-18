require './Filter.rb'

class FilterCascade < Filter

  def initialize
    super()
    @filters = []
  end

  def add_filter(filter)
    raise "Not a filter" unless (filter.is_a? Filter)
    @filters << filter
  end

  def reset
    @filters.each do |filter|
      filter.reset if filter.respond_to?(:reset)
    end
  end

  def cascade(input)
    cascade_input = input
    @filters.each do |filter|
      cascade_input = filter.get_output(cascade_input)
    end
    cascade_input
  end

  #TODO: override
  def print_table

  end

  private
  def print_headers
    str = @filters.each{|filter| str << "#{filter.type}#{filter.n}\t"}
    str << "Output"
  end
end