# Building libtapi is required for LD64 to build
git clone https://github.com/tpoechtrager/apple-libtapi.git
cd apple-libtapi
INSTALLPREFIX=$HOME/Gardenia ./build.sh
./install.sh
mkdir $HOME/Gardenia/include/llvm-c
cp src/llvm/include/llvm-c/lto.h $HOME/Gardenia/include/llvm-c
cd ..

git clone https://github.com/ProjectGardenia/dyld.git
cd dyld
cp -r include/* $HOME/Gardenia/include/
cd ..

git clone https://github.com/ProjectGardenia/xnu.git
cd xnu
cp EXTERNAL_HEADERS/Availability.h $HOME/Gardenia/include/
cp EXTERNAL_HEADERS/AvailabilityInternal.h $HOME/Gardenia/include/
cd ..

git clone https://github.com/ProjectGardenia/ld64.git
cd ld64
make
cd ..