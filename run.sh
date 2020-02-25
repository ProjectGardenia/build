# Building libtapi is required for LD64 to build
git clone https://github.com/tpoechtrager/apple-libtapi.git
cd apple-libtapi
INSTALLPREFIX=$HOME/Gardenia ./build.sh
./install.sh
mkdir $HOME/Gardenia/include/llvm-c
cp src/llvm/include/llvm-c/lto.h $HOME/Gardenia/include/llvm-c
cd ..

# Copy our own custom headers
cp -r include/* $HOME/Gardenia/include/

# Copy dyld headers to get ld64 to build
git clone https://github.com/ProjectGardenia/dyld.git
cd dyld
cp -r include/* $HOME/Gardenia/include/
cd ..

# Copy XNU Availability.h headers to get LD64 to build
# This Availability.h is different from os/availability.h installed in a previous step
git clone https://github.com/ProjectGardenia/xnu.git
cd xnu
cp EXTERNAL_HEADERS/Availability.h $HOME/Gardenia/include/
cp EXTERNAL_HEADERS/AvailabilityInternal.h $HOME/Gardenia/include/
cd ..

# Build ld64
git clone https://github.com/ProjectGardenia/ld64.git
cd ld64
make
cd ..