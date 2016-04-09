class CaesarCipher

	attr_reader :string, :key, :file

	LCASE_BEGIN = "a".ord
	UPCASE_BEGIN = "A".ord
	LCASE_LAST = "z".ord
	UPCASE_LAST = "Z".ord

	def initialize( file, key )
		@file = get_text(file)
		@key = key
	end
		
	def get_text(file)
		text = ""
		File.open(file).each { |line| text << line }
		text
	end


	def cipher
		cipher = string_array.map { |char| char =~ /[a-z]|[A-Z]/ ? translate( char, @key ) : char }.join
		File.write("export.txt", cipher)
	end

	private

		def string_array
		@file.split("")
	end

	def translate( letter, key )
			order = (letter.ord + key)

			case 
			when order > LCASE_LAST && letter == letter.downcase
				char_int = lower_case_limit( letter, order )
			when order > UPCASE_LAST && letter == letter.upcase
				char_int = upper_case_limit( letter, order )
			when order < LCASE_BEGIN && letter == letter.downcase
				char_int = lower_case_begin( letter, order )
			when order < UPCASE_BEGIN && letter == letter.upcase
				char_int = upper_case_begin( letter, order )
			else
				char_int = order.chr
			end

			char_int
	end

	def lower_case_limit( letter, key )
		((key - LCASE_LAST) + LCASE_BEGIN - 1 ).chr
	end

	def lower_case_begin( letter, key )
		((key - LCASE_BEGIN) + LCASE_LAST + 1 ).chr
	end

	def upper_case_limit( letter, key )
		((key - UPCASE_LAST) + UPCASE_BEGIN - 1 ).chr
	end

	def upper_case_begin( letter, key )
		((key - UPCASE_BEGIN) + UPCASE_LAST + 1 ).chr
	end

end













