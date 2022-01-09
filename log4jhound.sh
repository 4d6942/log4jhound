#!/bin/bash

echo "
.__                   _____     __.__                             .___
|  |   ____   ____   /  |  |   |__|  |__   ____  __ __  ____    __| _/
|  |  /  _ \ / ___\ /   |  |_  |  |  |  \ /  _ \|  |  \/    \  / __ | 
|  |_(  <_> ) /_/  >    ^   /  |  |   Y  (  <_> )  |  /   |  \/ /_/ | 
|____/\____/\___  /\____   /\__|  |___|  /\____/|____/|___|  /\____ | 
           /_____/      |__\______|    \/                  \/      \/ 
		   
v1.00                        Tomas Beaujean <https://linktr.ee/4d6942>


Usage: ./log4jhound.sh root_directory



Searching string in files...

"

grep -rn $1 -e 'log4j' --exclude="*.jar"

echo "

Unpacking and analyzing JAR files...

"

for jarfile in $(find $1 -iname '*.jar')
do	
	jarfilescan=$(unzip -p $jarfile META-INF/MANIFEST.MF | grep log4j)
	if [ -n "$jarfilescan" ]; then
		echo "File: $jarfile
"
		jarfilecontents=$(unzip -p $jarfile META-INF/MANIFEST.MF)
		echo "${jarfilecontents}

---------------

"
	fi
done

