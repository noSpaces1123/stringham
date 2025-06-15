# stringham
A utility library for manipulating strings.

### Setup
Copy the stringham.lua file into your project directory.
At the top of your Lua file, write `stringham = require "stringham"`.
All done!

### Functions
##### `stringham.getChar(str, index)`
Returns the character at index `index` in string `str`.

##### `stringham.prefix(listOfStrings, prefix)`
Returns all the items of a table (list) of strings `listOfStrings` prefixed with string `prefix`.

##### `stringham.suffix(listOfStrings, suffix)`
Returns all the items of a table (list) of strings `listOfStrings` suffixed with string `suffix`.

##### `stringham.infix(string1, string2, positionToPlaceString2)`
Returns `string1` with `string2` placed inside `string1` at the index `positionToPlaceString2`.

##### `stringham.split(str, separator)`
Supply a string `str` and a separator `separator` (single character). Returns a table containing the substrings of the string split by the separator (all substrings excluding the separator). If `separator` is an empty string or is nil, this function instead returns a table containing each letter of `str` as separate items.

##### `stringham.titleCaps(str, forceLower)`
Returns string `str` with the first letter of each word (separated by spaces) capitalized. If boolean `forceLower` is true (nil by default), the letters of each word in `str` other than the first letter will be put into lowercase.

##### `stringham.compositeList(tableOfStrings, separator, finder)`
Returns a string containing each item of table `tableOfStrings` (a list of strings) concatenated sequentially, separated by string `separator`. A function `finder` can optionally be included, where each item of the list is passed as an argument to `finder` and the return values of `finder(x)` are then used in the sequential concatenation.

##### `stringham.wonky(str)`
Returns string `str` with all of its letters randomly capitalized or uncapitalized.

##### `stringham.countWordInstances(str)`
Returns a table (dictionary) where each key-value pair has a word as its key and the number of instances of the word in the string `str`. For example, `stringham.countWordInstances("Hi and hello and goodbye.")` returns `{ ["Hi"] = 1, ["and"] = 2, ["hello"] = 1, ["goodbye"] = 1 }`

##### `stringham.scramble(str, ignoreSingleCharacterError)`
Returns `str` with its characters shuffled randomly. This function ensures it never returns `str` verbatim by pure coincidence. If boolean `ignoreSingleCharacterError` is true (nil by default), this function will not throw an error when `str` is only one character long and will instead return `str`.

##### `stringham.thanks()`
Returns "No problem, buddy."
