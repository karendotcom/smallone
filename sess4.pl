# Hash of arrays, because sometimes is it easier to locate with a hash, but what if you do not have unique keys to hash on?
# open a file of comma deliniated strings, turn each line into an array, using the the first field as a hash value, store all info as an array in  hash sorted by that value

use diagnostics;
use warnings;

my %hash;
my $subject = "Cecil McCecil";

open (FILEHANDLE, "<c:\\work\\input.txt");

my @inputArray = <FILEHANDLE>;
close FILEHANDLE;

for (@inputArray)
{
	# get rid of <CR> at end of line in input, $_ is the default operator in Perl, I could have said chomp($_);
	chomp;
	
	# Turn each line of input into and array deliniated by comma, again using the default operator
	my @tempArray = split(/,/);
	
	#using the content at the first array index as a hash value, create a hash of array values, notice the casting
	push (@{$hash{$tempArray[0]}},@tempArray);
}

#now go theough the hash and print out all values, again using the default operator
foreach (keys %hash)
{
	#here is where we cast each hash value as an array, notice the deafualt operator $_ at use again as the key
	for (@{$hash{$_}})
	{
		# these are all the records in ths hash
		print "$_\n";
	}
	print "\n\nHere is the next hash bucket:\n";
	
}

print "\nHere is the $subject hash bucket\n";
for (@{$hash{$subject}})
{
	print "$_\n";
}

print "\nHere is us changing Cecil's name to Norman on in memory\n";
for (@{$hash{$subject}})
{
	s%Cecil%Norman%gi;
	print "$_\n";
}


print "\nHere is us changing any Mc to Super MC in memory\n";
foreach (keys %hash)
{
	for (@{$hash{$_}})
	{
		s%Mc(.*)%MC Super $1%gi;
		print "$_\n";
	}
	print "\n";
}
