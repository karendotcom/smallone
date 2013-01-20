open(FILEHANDLE,"<c:\\work\\input.txt");
my %hash;
my @input = <FILEHANDLE>;
close FILEHANDLE;

for (@input)
{
	chomp;
	my @inArray = split (/,/);
	push (@{$hash{$inArray[0]}}, @inArray);
}

foreach (keys %hash)
{
	for (@{$hash{$_}})
	{
		print "$_\n";
	}
	print "\n";
}