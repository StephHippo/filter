class Integer

  def self.factorial
    (1..self).reduce(:*) || 1
  end
end