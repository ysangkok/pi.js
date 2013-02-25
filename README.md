Building
---

Depends on [gmp.js](https://github.com/kripken/gmp.js).

    ~/emscripten/emcc -I ~/gmp.js pi.c ~/gmp.js/.libs/libgmp.a --pre-js prejs.js -o pi.html

Ideomatic bug
---

    $ ./cmp.sh 100000
    + '[' 1 == 0 ']'
    + prec=100000
    + cut -c 3-100002
    + pi 100002
    
    real    0m0.432s
    user    0m0.424s
    sys 0m0.000s
    + cut -c 2-100001
    + tail -n1
    + ./a.out 100000
    
    real    0m0.196s
    user    0m0.180s
    sys 0m0.004s
    + cut -c 2-100001
    + tail -n1
    + js ./a.out.js 100000
    
    real    1m16.057s
    user    1m13.737s
    sys 0m1.684s
    + cut -c 2-100001
    + node -e 'console.log(require('\''./ideomatic'\'')[0](100000))'
    
    real    8m18.314s
    user    8m9.631s
    sys 0m4.320s
    + cmp /tmp/ref /tmp/gmp
    + cmp /tmp/ref /tmp/gmpjs
    + cmp /tmp/ref /tmp/ideomatic
    /tmp/ref /tmp/ideomatic differ: byte 63199, line 1
