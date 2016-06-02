normalize_text() {
  awk '{print tolower($0);}' | sed -e "s/’/'/g" -e "s/′/'/g" -e "s/''/ /g" -e "s/'/ ' /g" -e "s/“/\"/g" -e "s/”/\"/g" \
  -e 's/"/ " /g' -e 's/\./ \. /g' -e 's/<br \/>/ /g' -e 's/, / , /g' -e 's/(/ ( /g' -e 's/)/ ) /g' -e 's/\!/ \! /g' \
  -e 's/\?/ \? /g' -e 's/\;/ /g' -e 's/\:/ /g' -e 's/-/ - /g' -e 's/=/ /g' -e 's/=/ /g' -e 's/*/ /g' -e 's/|/ /g' \
  -e 's/«/ /g' | tr 0-9 " "
}

# gzip -dc nyt_eng_199407.gz | awk '{print tolower($0);}' | ./giga.pl > text

DIR_gigawords_nyt=/partition/ptn176/english_gigaword/5.0/data/nyt_eng

# DIR_gigawords_nyt=data_test
# echo $DIR_gigawords_nyt

touch cleaned_nyt.txt
for f in `ls $DIR_gigawords_nyt`; do
  echo $DIR_gigawords_nyt/$f
  gzip -dc $DIR_gigawords_nyt/$f | normalize_text | ./giga.pl >> cleaned_nyt.txt
done
