def search4letters(word: str, letters: str, caseSensitive: bool=True) -> tuple:
    """Return a dictionary of letters found in a word
    and a list of letters that were not found. Allows
    to turn on case sensitive search."""

    if caseSensitive == True:
        word = word.lower()
        letters = letters.lower()

    found = {}
    not_found = set()

    for letter in letters:
        count = word.count(letter)
        if count > 0:
            found[letter] = count
        else:
            not_found.add(letter)

    return found, not_found
