require 'date'

class NumberToWord
	def convert_to_word(number)
		time_start = Time.now()
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
		keys = number.split('').map{|num|letters[num]}
		dictionary = load_dictonary
		result = matced_words(dictionary, keys)
		expected_result = final_words(result,keys,dictionary)
		time_end = Time.now()
    	time_taken = time_end.to_f - time_start.to_f
    	return {time_taken: time_taken, result: expected_result}
	end

	private

	def invalid_input(number)
		return true if number.empty? || number.length < 3  || number.split('').select{|num| (num.to_i == 0 || num.to_i == 1)}.count>0
	end

	def load_dictonary
		dictionary = {}
		for i in (1..30)
      		dictionary[i] = []
    	end
	    File.foreach(Dir.pwd + '/data/dictionary.txt') do |word|
	      dictionary[word.length] << word.chop.to_s.downcase
	    end
	    return dictionary
	end

	def matced_words(dictionary, keys)
		results = {}
    	total_number = keys.length - 1
	    for i in (2..total_number - 2)
	      first_array = keys[0..i]
	      next if first_array.length < 3
	      second_array = keys[i + 1..total_number]
	      next if second_array.length < 3
	      first_combination = first_array.shift.product(*first_array).map(&:join)
	      next if first_combination.nil?
	      second_combination = second_array.shift.product(*second_array).map(&:join)
	      next if second_combination.nil?
	      results[i] = [(first_combination & dictionary[i+2]), (second_combination & dictionary[total_number - i +1])]
    	end
    	return results
	end

	def final_words(results,keys,dictionary)
		final_words = []
	    results.each do |key, combinataions|
	      next if combinataions.first.nil? || combinataions.last.nil?
	      combinataions.first.product(combinataions.last).each do |combo_words|
	        final_words << combo_words
	      end
	    end
    # for all numbers
    	final_words << (keys.shift.product(*keys).map(&:join) & dictionary[11]).join(", ")
    	return final_words
	end
end

resultant_words = NumberToWord.new().convert_to_word("6757632587")
print resultant_words
