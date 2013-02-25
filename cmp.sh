#!/bin/bash -ex
if [ "$#" == "0" ]; then
    prec=100
else
    prec=$1
fi
time pi $(($prec + 2)) | cut -c 3-$(($prec + 2)) > /tmp/ref
time ./a.out       $prec | tail -n1 | cut -c 2-$(($prec + 1)) > /tmp/gmp
time js ./a.out.js $prec | tail -n1 | cut -c 2-$(($prec + 1)) > /tmp/gmpjs
time node -e "console.log(require('./ideomatic')[0]($prec))" | cut -c 2-$(($prec + 1)) > /tmp/ideomatic
cmp /tmp/{ref,gmp}
cmp /tmp/{ref,gmpjs}
cmp /tmp/{ref,ideomatic}
