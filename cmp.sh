#!/bin/bash -ex
if [ "$#" == "0" ]; then
    param=100
else
    param=$1
fi
prec=$(($param))
p2prec=$(($param + 2))
time echo $(pi $p2prec | dd skip=2 bs=1 count=$prec status=noxfer) > /tmp/ref
time echo $(./a.out       $prec | tail -n1 | dd skip=1 bs=1 count=$prec status=noxfer) > /tmp/gmp
time echo $(js ./a.out.js $prec | tail -n1 | dd skip=1 bs=1 count=$prec status=noxfer) > /tmp/gmpjs
time node -e "console.log(require('./ideomatic')[0]($prec))" | cut -c 2- | rev | cut -c 11- | rev > /tmp/ideomatic
cmp /tmp/{ref,gmp}
cmp /tmp/{ref,gmpjs}
cmp /tmp/{ref,ideomatic}
