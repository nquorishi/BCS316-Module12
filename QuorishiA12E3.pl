#NQ-BCS316
#Exercise 3 -  Install the module named Module::CoreList and write a script 
#that lists all of your installed modules to a text file.
use 5.23.0;
use strict;
use warnings;
use Module::CoreList;

my $filename = "installed_modules.txt";

#Gets list of installed modules and sort alphabetically:
my @modules = sort keys %{$Module::CoreList::version{'5.032'}{'%Module::CoreList::version'}};

#Writes list of installed modules to file:
open my $fh, '>', $filename or die "Could not open file '$filename' for writing: $!";
print $fh join("\n", @modules);
close $fh;

print "List of installed modules written to $filename.\n";
