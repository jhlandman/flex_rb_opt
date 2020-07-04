

# Checking progress
bookdown::serve_book() # ctrl + shift + F10 to reset

# for pdf compilations (only every once in a while)
# retains .tex artifact
# make sure to use ctrl + shift + F10 before use
bookdown::render_book("index.Rmd")

# to publish to github pages just copy the book_folder over the ../docs folder with the same name