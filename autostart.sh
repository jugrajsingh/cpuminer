sudo apt-get install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ screen zlib1g-dev

if  ! [ -e "cpuminer" ]
then
	./build.sh
fi

if test $1 = q;
then
	screen ./cpuminer -a qubit -o stratum+tcp://s1.theblocksfactory.com:9000 -u jugraj.worker -p 4
elif test $1 = m;
then
	screen ./cpuminer -a myr-gr -o stratum+tcp://stratum.dgb-groestl.theblocksfactory.com:9003 -u jugraj.worker -p 4
else
echo 'Not Specified'
fi
