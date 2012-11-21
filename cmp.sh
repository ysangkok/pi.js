#!/bin/bash -ex
prec=$(($1))
p2prec=$(($1 + 2))
time pi $p2prec | dd skip=2 bs=1 count=$prec status=noxfer > /tmp/ref
time ./a.out $prec | tail -n1 | dd skip=1 bs=1 count=$prec status=noxfer > /tmp/gmp
cmp /tmp/{ref,gmp}
