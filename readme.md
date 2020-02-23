# Pig Latin Translator

Pig Latin Translator translates words into Pig Latin.




## Usage
Run the follow commands in the command line.

To translate a word or phrase directly, add the -s option and either pass in words to be translated in quotes
```bash
ruby main.rb -s "String to translate"
```
or without quotes with words separated by spaces
```bash
ruby main.rb -s String to translate
```

To translate a file, add the -f option and pass in the input text file first and then the output text file that contains the translated text you wish to create
```bash
ruby main.rb -f text.txt output.txt
```


## License
[MIT](https://choosealicense.com/licenses/mit/)
