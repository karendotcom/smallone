
use warnings;

my %hash;
my @inputArray;

open (FILEHANDLE, "<c:\\work\\input.txt");
@inputArray = <FILEHANDLE>;
close (FILEHANDLE);


# put the arrays in a hash sorted by name
for(@inputArray)
{
	chomp($_);
	my @tempArray = split(/,/);
	
	push(@{$hash{$tempArray[0]}}, @tempArray);
	
}

foreach (keys %hash)
{
	for (@{$hash{$_}})
	{
		print "$_\n";
	}
	print "\n";
}

print "This is Cecil's array, found in his hash\n";
foreach (@{$hash{"Cecil McCecil"}})
{
	print "$_\n";
}