use DBI;

# Fake limit
# --
# my $limit_bytes = 100000;
# --

# compute 4.7 GB
# --
my $limit_bytes = 5028970496;
# -- 

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

# Connection to DB
# --
my $myConnection = DBI->connect(
	"DBI:mysql:$database:$ip",
	$username,
	$password);
# -- 

# Prepare template for query
# --
my $query = $myConnection->prepare("SELECT SUM(sizeOfFiles) FROM files;");
# -- 

# Execute query 
# -- 
$query->execute();
# --

# Get sum sizeOfFiles
# --
my @rows = $query->fetchrow_array;
my $size_sum = $rows[0];
# -- 

# Check size_sum
# --
if ($size_sum>$limit_bytes){
	print "Size of files is more then 4.7 GB \n";
}
elsif ($size_sum<$limit_bytes){
	print "Size of files is less then 4.7 GB \n";
}
else {
	print "Something wrong...";
}
# --

print "Result: $size_sum \n";