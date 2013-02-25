Building
---

Depends on [gmp.js](https://github.com/kripken/gmp.js).

    ~/emscripten/emcc -I ~/gmp.js pi.c ~/gmp.js/.libs/libgmp.a --pre-js prejs.js -o pi.html
