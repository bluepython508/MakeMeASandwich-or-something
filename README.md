# MakeMeASandwich-or-something
A makefile and accompanying files to make sandwiches, or any other ascii art you want.
Supply your own ASCII art.
Ascii art goes in {food}\_recipe\_{number} files.

Usage: `sudo make me (a|an|some) {food}`

`make clear_dishes` deletes the files the food ends up in.

`make recipes` shows the available recipes.

Example: If you have ascii art of a sandwich in your working directory as sandwich_recipe_1
`sudo make me a sandwich` will create a file called sandwich with your ascii art sandwich.
You must have write permissions to your working directory.

Requires Python 3 as `python` and Pip3 as `pip`, and installs `fuzzywuzzy` and `python-Levenshtein` automatically with `pip`.

There are a few other tricks it has.

<details><summary>Hint:</summary>
    Look at the fuzzywuzzy library
</details>
