#!/usr/bin/env bash
# https://github.com/plaurent/gnustep-build/blob/master/ubuntu-19.10-clang-9.0-runtime-2.0/GNUstep-buildon-ubuntu1910.sh
set -euo pipefail

mkdir /tmp/objectiveC
cd /tmp/objectiveC

export CC=clang

curl -LO https://github.com/apple/swift-corelibs-libdispatch/archive/refs/tags/swift-6.1.1-RELEASE.tar.gz
tar -xzf swift-*.tar.gz
rm swift-*.tar.gz
pushd swift-*
mkdir Build
cd Build/
cmake -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_FLAGS="-Wno-error=unused-but-set-variable" ..
make install
popd

curl -LO https://github.com/gnustep/tools-make/releases/download/make-2_9_3/gnustep-make-2.9.3.tar.gz
tar -xzf gnustep-make-*.tar.gz
rm gnustep-make-*.tar.gz
pushd gnustep-make-*
./configure --disable-importing-config-file --enable-native-objc-exceptions --enable-objc-arc --enable-install-ld-so-conf --with-library-combo=ng-gnu-gnu && make install
popd

curl -LO https://github.com/gnustep/libobjc2/archive/v2.3.tar.gz
tar -xzf v*.tar.gz
rm v*.tar.gz
pushd libobjc2-*
mkdir Build
cd Build/
cmake -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ ..
make -j8
make install
popd

# Install gnustep-make again, https://blog.metaobject.com/2019/01/objective-smalltalk-on-linux-via.html, some warning about conflicting error mechanisms between gnustep-base and -make
pushd gnustep-make-*
make clean && ./configure --disable-importing-config-file --enable-native-objc-exceptions --enable-objc-arc --enable-install-ld-so-conf --with-library-combo=ng-gnu-gnu && make install
popd


curl -LO https://github.com/gnustep/libs-base/releases/download/base-1_31_1/gnustep-base-1.31.1.tar.gz
tar -xzf gnustep-base-*.tar.gz
rm gnustep-base-*.tar.gz
pushd gnustep-base-*
./configure --disable-iconv --disable-xml --disable-tls
make install
popd

# Need something newer than 0.1.1 because of https://github.com/gnustep/libs-corebase/issues/14
curl -L https://github.com/gnustep/libs-corebase/archive/e5983493d5ddf9c5b7e562f166855d9517a3f179.tar.gz -o corebase-e5983493d5ddf9c5b7e562f166855d9517a3f179.tar.gz
tar -xzf corebase-*.tar.gz
rm corebase-*.tar.gz
pushd libs-corebase-*
./configure
make
make install
popd

ldconfig

rm -r /tmp/objectiveC
