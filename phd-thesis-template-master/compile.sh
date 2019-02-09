#!/bin/bash
set -e

main=true
statement=true
poster=true
cd=true
presentation=true

script_dir=`dirname $0`
script_dir=`realpath $script_dir`

# main
if $main; then
	echo "MAIN"
	cd $script_dir/text/main
	bash compile.sh > /tmp/main.out
fi

# statement
if $statement; then
	echo "STATEMENT"
	cd $script_dir/text/statement
	bash compile.sh > /tmp/statement.out
fi

# poster
if $poster; then
	echo "POSTER"
	cd $script_dir/text/poster
	bash compile.sh > /tmp/poster.out
fi

# cd
if $cd; then
	echo "CD"
	cd $script_dir/text/cd
	bash compile.sh > /tmp/cd.out
fi

# presentation
if $presentation; then
	echo "PRESENTATION"
	cd $script_dir/text/presentation
	bash compile.sh > /tmp/presentation.out
fi

echo
echo OK
