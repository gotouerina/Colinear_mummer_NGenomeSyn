##Usage perl dot.pl <coords_file> <syn_file>
use warnings;
open $I,"<$ARGV[0]" or die "No input_file!"."\n"."Usage:perl syn.pl <coords_file> <filter_file>";
open $O,">$ARGV[1]" or die "Please assign syn_file!"."\n"."Usage:perl syn.pl <coords_file> <filter_file>";
while(<$I>)
{
	if(/\s+[0-9].*\s+[0-9].*\s+[0-9].*/)
	{
		s/\|/ /g;
		my @line=split(/\s+/);
		if($line[-7] > 100 && $line[-6] > 100)
		{
			print {$O} "$line[-2]\t"."$line[-11]\t"."$line[-10]\t"."$line[-1]\t"."$line[-9]\t"."$line[-8]";
		
		print {$O} "\n";
		}
	}
	else
	{
	}
}
close $I;
close $O;
