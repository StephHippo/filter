class Fixnum
  def factorial
    (1..self).reduce(:*) || 1
  end
end