require './filters/GainFilter.rb'

class GainFilter < FIRFilter

  def initialize(gain)
      super([gain])
  end

end