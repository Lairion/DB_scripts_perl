use DBI;
use strict;
use warnings;
use Scalar::Util qw(looks_like_number);
use File::stat;

# Customer's input for connection to databases
# --
print "Input name database: ";
chomp(my $database = <>);
print "Input IP: ";
chomp(my $ip = <>);
print "Input username: ";
chomp(my $username = <>);
print "Input password: ";
chomp(my $password = <>);
# --
# Inputs for fake data 

# --
print "How many files you want to copy: ";
chomp(my $count = <STDIN>);
print "What's text you want to add in files:\n";
my $some_text = <>;
# --


# Connection to DB
# --
my $myConnection = DBI->connect(
	"DBI:mysql:$database:$ip",
	$username,
	$password);
# --

# Prepare template for query
# --
my $query = $myConnection->prepare("INSERT INTO files(sizeOfFiles) VALUES (?)"); 
# --

# Checks the type of $count is a number
# --
if (looks_like_number($count)){
	# Create fake data in file
	# --
	my $filesname = 'fake_text.txt';
	open(my $fl,">>",$filesname) or die "can't open $filesname";
	print $fl $some_text;
	close($fl);
	# --

	# Get file size
	# --
	my $size = stat($filesname)->size;
	# --

	# Do query to DB for create row. 
	# This query will be repeated $count times
	# --
	for (my $i=0;$i<=$count;$i++){
		$query->execute($size+0);
	}
	# --
	
}
# --