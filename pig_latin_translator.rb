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

		# check if word doesn't contain any alphabetical characters
		if word.scan(/[A-Za-z]/).empty?
			has_no_chars = true
		end
		
		# if word doesn't contain any alphabetical characters
		if !has_no_chars

			# if word is longer than a letter and is all caps
			if word == word.upcase && word.length > 1
				all_caps = true
			# else if word is capitalized
			elsif word == word.capitalize
				has_capital = true
			end

			# find position of last alphabetical character
			last_char_index = word.rindex(/[A-Za-z]/)
			
			# if last alphabetical character is at the end of the word, there are no non alphabetical characters to append to end
			if last_char_index == word.length - 1
				non_characters = ""
			else
				non_characters = word[(last_char_index+1)..-1]
			end
			word = word[0..last_char_index]


			# find position of first vowel
			first_vowel_index = word.index(/[aeiouyAEIOUY]/)
			
			# if there are no vowels, assume first it is at first index
			if first_vowel_index.nil?
				first_vowel_index = 0
			# if vowel is at first index, end ay is changed to way.
			elsif first_vowel_index == 0
				# if first vowel is y, treat like consonant
				if !word[first_vowel_index].scan(/[yY]/).empty?
					first_vowel_index += 1
				else
					end_ay = "way"
				end
			end

			word.downcase!

			# combine second portion of word up to first found vowel and first portion of word combined with appropriate ay
			word = word[first_vowel_index..-1] + (word[0...first_vowel_index]+end_ay)
			
			if all_caps
				word.upcase!
			elsif has_capital
				word.capitalize!
			end

			return word + non_characters
			
		# return the word itself if no alphabetical characters are found
		else
			return word
		end

		
	end
end

