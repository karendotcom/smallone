#lf;'sd
use warnings;
use diagnostics;

open (FILEHANDLE, "<c:\\work\\input.txt");
my @inputArray = <FILEHANDLE>;
close FILEHANDLE;
my %hash;

for (@inputArray)
{
	chomp;
	my @tempArray = split (/,/);
	push (@{$hash{$tempArray[0]}}, @tempArray);
}

foreach (keys %hash)
{
	for (@{$hash{$_}})
	{
		print "$_\n";
	}
	print "\n";
}
