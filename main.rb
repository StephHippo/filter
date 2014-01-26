require './publicize.rb'
require './filters/BinomialFilter.rb'
begin

	@binomial = BinomialFilter.new(13)
	BinomialFilter.publicize(:binomial_value) do
		puts "#{@binomial.binomial_value}"
	end
end