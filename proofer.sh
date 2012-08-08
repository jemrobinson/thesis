#! /bin/bash
listoftexfiles=$(find . -name "*.tex")

for texFile in $listoftexfiles; do
  aspell -c -t --lang=en_gb_oed $texFile
done
echo "weasel words: "
sh bin/weasel.sh $listoftexfiles
echo

echo "passive voice: "
sh bin/passive.sh $listoftexfiles
echo

echo "duplicates: "
perl bin/dups.pl $listoftexfiles

echo "word count: "
texcount -inc thesis.tex
