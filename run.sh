git clone https://github.com/tpoechtrager/apple-libtapi.git
cd apple-libtapi
INSTALLPREFIX=$HOME/Gardenia ./build.sh
./install.sh
cd ..

git clone https://github.com/ProjectGardenia/ld64.git
cd ld64
make
cd ..