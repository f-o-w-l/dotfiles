find . -type d -empty -print0 | xargs -0 -I {} /bin/rm -r "{}"
