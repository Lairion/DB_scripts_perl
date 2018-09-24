Before you run this scripts you must install libdbd-mysql-perl using ubuntu console
	apt-get install libdbd-mysql-perl
	OR
	apt install libdbd-mysql-perl

Then you can run scripts.

For script running in local, use this command:

	For create fake row in DB
		perl -Ilocal/lib/perl5 local/src/create_content.pl

	For check summary size of files
		perl -Ilocal/lib/perl5 local/src/check_size_of_file.pl

You can find my script hear in this repository:

local/src/