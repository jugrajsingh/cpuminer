sudo apt-get -y install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ zlib1g-dev tor screen

if  ! [ -e "cpuminer" ]
then
	./build.sh
fi

# $1 Currency (Digibyte as DGB, Electroneum as ETN)
# S2 Algorithm (qubit as q, myr-gr as m)
# $3 ETN Pool



if test $1 = DGB;
then
	if test $2 = q;
	then
		screen -d -m torsocks ./cpuminer -a qubit -o stratum+tcp://s1.theblocksfactory.com:9000 -u jugraj.worker -p 4
	elif test $1 = m;
	then
		screen -d -m torsocks ./cpuminer -a myr-gr -o stratum+tcp://stratum.dgb-groestl.theblocksfactory.com:9003 -u jugraj.worker -p 4
	fi
elif test $1 = ETN;
then
	if test $3 = easy;
	then
		screen -d -m torsocks ./cpuminer -a cryptonight -o stratum+tcp://etn.easyhash.io:3630 -u etnkKPTknoHRSGXHakPfSSaDxaBnbAZ51gbdjsQ7eBN3Ru4AZVd49RLMFJVZDbodUTA7y9cmityG6EBszT1Dr4VR7RK7a71SMj -p 4
	else
		screen -d -m torsocks ./cpuminer -a cryptonight -o stratum+tcp://asiapool.electroneum.com:3333 -u etnkKPTknoHRSGXHakPfSSaDxaBnbAZ51gbdjsQ7eBN3Ru4AZVd49RLMFJVZDbodUTA7y9cmityG6EBszT1Dr4VR7RK7a71SMj -p 4
	fi
else
echo 'Currency Not Specified'
fi
