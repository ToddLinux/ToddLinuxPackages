# See LICENSE for license details.
#!/bin/bash
set -euo pipefail

unpack_src() {
    tar xf wget2-2.0.0.tar.gz
    cd wget2-2.0.0
    return
}

configure() {
    ./configure --prefix=/usr --with-ssl
}

make_install() {
    make
    make DESTDIR=$TODD_FAKE_ROOT_DIR -j1 install
    return
}

unpack_src && configure && make_install
