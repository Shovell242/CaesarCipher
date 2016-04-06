class CaesarCipher

	attr_reader :string, :key

	LCASE_BEGIN = "a".ord
	UPCASE_BEGIN = "A".ord
	LCASE_LAST = "z".ord
	UPCASE_LAST = "Z".ord

	def initialize( string, key)
		@string = string
		@key = key
	end
		
	def cipher
		string_array.map { |char| char =~ /[a-z]|[A-Z]/ ? translate( char, @key ) : char }.join
	end

	private

		def string_array
		@string.split("")
	end

	def translate( letter, key )
			order = (letter.ord + key)

			if order > LCASE_LAST && letter == letter.downcase

				char_int = lower_case_limit( letter, order )

			elsif order > UPCASE_LAST && letter == letter.upcase

				char_int = upper_case_limit( letter, order )

			else
				char_int = order.chr
			end

			char_int
	end

	def lower_case_limit( letter, key )
		((key - LCASE_LAST) + LCASE_BEGIN - 1 ).chr
	end

	def upper_case_limit( letter, key )
		((key - UPCASE_LAST) + UPCASE_BEGIN - 1 ).chr
	end

end













