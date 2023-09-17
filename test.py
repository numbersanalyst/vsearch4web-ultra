import pprint

vowels = ('a', 'e', 'i', 'o', 'u')
word = input("Podaj słowo, w którym należy wyszukać samogłoski: ")

found = {letter: word.count(letter) for letter in word if letter in vowels}
not_found_letters = [letter for letter in vowels if letter not in found]

pprint.pprint(found)
pprint.pprint(not_found_letters)