#!/bin/sh
echo BRUN_SV_SEED=$BRUN_SV_SEED

if [ $BRUN_SV_SEED == random ]
then
    export SEED=$RANDOM
else
    export SEED=$BRUN_SV_SEED
fi

echo FORWARD_SEED=$SEED

make -f $DV_AZADI/azadi-verify/Makefile TEST=$BRUN_TEST_NAME SEED=$SEED ITERATIONS=1
