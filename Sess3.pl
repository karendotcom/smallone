use warnings;
use diagnostics;


my @array;
my %hash;

open(FILEHANDLE, "<C:\\work\\input.txt");

@array = <FILEHANDLE>;
close FILEHANDLE;

for (@array)
{
	chomp ($_);
	my @tempArray = split(/,/);
	push (@{$hash{$tempArray[0]}}, @tempArray);
	
	my $string = join(",",@tempArray);
	print "this is my string, $string\n";
	
}

foreach (keys %hash)
{
	for (@{$hash{$_}})
	{
		print "$_\n";
	}
	print "\n";
}