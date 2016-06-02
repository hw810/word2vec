# make
# if [ ! -e text8 ]; then
#   wget http://mattmahoney.net/dc/text8.zip -O text8.gz
#   gzip -d text8.gz -f
# fi

INPUT=process_data/cleaned_nyt.txt

SIZE=20
WIN=1
NEG=25
HS=0
ITER=15
OUTPUT=out/vec_s$SIZE\_w$WIN\_n$NEG\_h$HS\_i$ITER.bin

time ./word2vec/trunk/word2vec -train $INPUT \
                               -output  $OUTPUT \
                               -cbow 0 \
                               -size $SIZE \
                               -window $WIN \
                               -negative $NEG \
                               -hs $HS \
                               -sample 1e-4 \
                               -threads 20 \
                               -binary 1 \
                               -iter $ITER


# ./distance vectors.bin
