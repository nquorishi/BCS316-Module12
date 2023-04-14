#NQ-BCS316
#Exercise 2 - Use the term : Menus module to prompt the user for 3 selections. 
#Then display the one the user picked.
#Example - Prompt the user for Apple, Orange and Grape.  
#If they select the option for Orange, tell them they selected Orange.
use 5.23.0;
use strict;
use warnings;
use Term::Menus;

my $menu = Term::Menus->new();
my $selection = $menu->choose(
    ['a', 'Apple'],
    ['o', 'Orange'],
    ['g', 'Grape'],
    ['q', 'Quit']
);

if ($selection eq 'o') {
    print "You selected Orange!\n";
} else {
    print "You selected $selection.\n";
}
