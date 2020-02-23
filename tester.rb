require_relative 'pig_latin_translator'
require "minitest/autorun"

##
# Holds tests for PigLatinTranslator class
class TestPigLatin < Minitest::Test
	##
	# Tests a collection of phrases
	def test_words
		test_words = ["hello","eat","yellow","eat world", "Hello", "Apples", "eat… world?!", "school", "quick","she’s great!", "HELLO", "Hello There", "Yes, he spent $1000!!!", "rhythm", "a", "I"]
		translated_words = ["ellohay","eatway","ellowyay","eatway orldway","Ellohay","Applesway","eatway… orldway?!","oolschay","uickqay","e’sshay eatgray!","ELLOHAY","Ellohay Erethay","Esyay, ehay entspay $1000!!!","ythmrhay", "away", "Iway"]

		test_words.each_with_index do |word, index|
			translated_word = PigLatinTranslator.translate_line(word)
			assert_equal translated_words[index], translated_word, "#{word} should translate to #{translated_words[index]}" 
		end
	end
end

