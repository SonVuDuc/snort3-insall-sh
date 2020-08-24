#!/bin/bash

#Install the Snort 3 prerequisites

sudo apt-get update && sudo apt-get dist-upgrade -y
mkdir ~/snort_src
cd ~/snort_src

sudo apt-get install -y build-essential autotools-dev libdumbnet-dev \
libluajit-5.1-dev libpcap-dev zlib1g-dev pkg-config libhwloc-dev \
cmake

sudo apt-get install -y liblzma-dev openssl libssl-dev cpputest \
libsqlite3-dev uuid-dev

sudo apt-get install -y asciidoc dblatex source-highlight w3m

sudo apt-get install -y libtool git autoconf

sudo apt-get install -y bison flex libcmocka-dev

sudo apt-get install -y libnetfilter-queue-dev libmnl-dev


#Install additional package

#Instal safec
cd ~/snort_src
wget https://github.com/rurban/safeclib/releases/download/v08112019/libsafec-08112019.0-gad76c7.tar.gz
tar -xzvf libsafec-08112019.0-gad76c7.tar.gz
cd libsafec-08112019.0-gad76c7/
./configure
make
sudo make install

#Install PCRE
cd ~/snort_src/
wget https://ftp.pcre.org/pub/pcre/pcre-8.43.tar.gz
tar -xzvf pcre-8.43.tar.gz
cd pcre-8.43
./configure
make
sudo make install

#Install gperftools
sudo apt-get install -y libunwind-dev
cd ~/snort_src
wget https://github.com/gperftools/gperftools/releases/download/gperftools-2.7.90/gperftools-2.7.90.tar.gz
tar xzvf gperftools-2.7.90.tar.gz
cd gperftools-2.7.90
./configure
make
sudo make install

#Install Hyperscan. Hyperscan require Ragel and Boost
cd ~/snort_src
wget http://www.colm.net/files/ragel/ragel-6.10.tar.gz
tar -xzvf ragel-6.10.tar.gz
cd ragel-6.10
./configure
make
sudo make install

#Download the Boost 1.72.0 libraries
cd ~/snort_src
wget https://dl.bintray.com/boostorg/release/1.72.0/source/boost_1_72_0.tar.gz
tar -xvzf boost_1_72_0.tar.gz

#Install Hyperscan 5.2.1
cd ~/snort_src
wget https://github.com/intel/hyperscan/archive/v5.2.1.tar.gz
tar -xvzf v5.2.1.tar.gz
mkdir ~/snort_src/hyperscan-5.2.1-build
cd hyperscan-5.2.1-build/
cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DBOOST_ROOT=~/snort_src/boost_1_72_0/ ../hyperscan-5.2.1
make
sudo make install

#Install flatbuffers
cd ~/snort_src
wget https://github.com/google/flatbuffers/archive/v1.12.0.tar.gz \
 -O flatbuffers-v1.12.0.tar.gz
tar -xzvf flatbuffers-v1.12.0.tar.gz
mkdir flatbuffers-build
cd flatbuffers-build
cmake ../flatbuffers-1.12.0
make
sudo make install

#Install Data AcQuisition library (DAQ)
cd ~/snort_src
git clone https://github.com/snort3/libdaq.git
cd libdaq
./bootstrap
./configure
make
sudo make install

sudo ldconfig

#Install Snort3
cd ~/snort_src
git clone git://github.com/snortadmin/snort3.git
cd snort3
./configure_cmake.sh --prefix=/usr/local --enable-tcmalloc
cd build
make
sudo make install

cd ~

/usr/local/bin/snort -V
