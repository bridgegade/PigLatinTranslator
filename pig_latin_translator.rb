##
# This class holds methods for translating text to Pig Latin
class PigLatinTranslator

	##
	# Translates a single line of text with words separated by spaces
	def self.translate_line(line)
		line = line.strip
		words_array = line.split(" ")
		translated_words = words_array.map{|word| translate_word(word)}
		return translated_words.join(" ")
	end

	##
	# Translates a single word
	def self.translate_word(word)
		has_capital = false
		all_caps = false
		has_no_chars = false
		end_ay = "ay"
		if word.scan(/[A-Za-z]/).empty?
			has_no_chars = true
		end
		
		if !has_no_chars
			if word == word.upcase && word.length > 1
				all_caps = true
			elsif word == word.capitalize
				has_capital = true
			end

			last_char_index = word.rindex(/[A-Za-z]/)
	
			if last_char_index == word.length - 1
				non_characters = ""
			else
				non_characters = word[(last_char_index+1)..-1]
			end
			word = word[0..last_char_index]

			first_vowel_index = word.index(/[aeiouyAEIOUY]/)
			
			if first_vowel_index.nil?
				first_vowel_index = 0
			elsif first_vowel_index == 0
				if !word[first_vowel_index].scan(/[yY]/).empty?
					first_vowel_index += 1
				else
					end_ay = "way"
				end
			end

			word.downcase!

			word = word[first_vowel_index..-1] + (word[0...first_vowel_index]+end_ay)
			
			if all_caps
				word.upcase!
			elsif has_capital
				word.capitalize!
			end

			return word + non_characters
		else
			return word
		end

		
	end
end

