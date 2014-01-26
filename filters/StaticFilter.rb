require './filters/Filter.rb'

class StaticFilter < Filter

	def get_output(input)
		clean_input = normalize_vectors(input)
		super(clean_input)
	end

	private

	def normalize_vectors(vectors)
		norm = 0
		vectors.each do |vector|
			scalar += vector**2
		end
		norm
	end

end