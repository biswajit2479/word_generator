class NumberToWord
	def convert_to_word(number)
		return [] if invalid_input(number)
		letters = {
					"2" => ["a", "b", "c"],
					"3" => ["d", "e", "f"],
					"4" => ["g", "h", "i"],
					"5" => ["j", "k", "l"],
					"6" => ["m", "n", "o"],
					"7" => ["p", "q", "r", "s"],
					"8" => ["t", "u", "v"],
					"9" => ["w", "x", "y", "z"]
				}
			
	end

	private

	def invalid_input(number)
		return true if number.empty? || number.length < 3  || number.split('').select{|num| (num.to_i == 0 || num.to_i == 1)}.count>0
	end

end

resultant_words = NumberToWord.new().convert_to_word("")
print resultant_words