Solution: make-pdf.sh
---------------------

    pandoc "($1).md" -o "($1).pdf"

Make shell scripts with wildcards
---------------------------------

We want to create many pdf's at the same time

### For a list: many-pdfs.sh

    for file in "$@"
    do
      pandoc "($file).md" -o "($file).pdf"
    done

1.  bash many-pdfs.sh {rhino, lion}
2.  rm \*.pdf
3.  bash many-pdfs.sh \*
4.  bash many-pdfs.sh \*.md

### Loop through all files in a folder: all-pdfs.sh

    for file in "$@"
    do
      basename=$(basename "$file" .md)
      pandoc "$basename.md" -o "$basename.pdf"
    done```

1.  bash all-pdfs.sh \*.md

change default editor (VIM hell)
--------------------------------

cd (\~)

atom .bashrc

add into new lines

make atom standard editor
=========================

    export VISUAL=atom
    export EDITOR="$VISUAL"

comment everything nicely with a hashtag
