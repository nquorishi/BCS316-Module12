#NQ-BCS316
#Exercise 1 - Use the Digest :: MD5 function to prompt the user for a password twice. 
#If the first doesn’t match the second, have them re-type both.
#Then use Digest :: MD5 to create a hash and store the hash in a file.
#Finally, prompt the user for the password, create a hash of it and 
#then read the file to compare them, Tell the usr if they successfully entered the 
#correct password.
use 5.23.0;
use strict;
use warnings;
use Digest::MD5;

my $password;

# Prompts user to enter password twice:
do {
    print "Enter password: ";
    $password = <STDIN>;
    chomp $password;
    print "Confirm password: ";
    my $confirm_password = <STDIN>;
    chomp $confirm_password;

    if ($password ne $confirm_password) {
        print "Passwords do not match. Please try again.\n";
        $password = undef;
    }
} until defined $password;

#Creates hash of password and store in file:
my $hash = Digest::MD5::md5_hex($password);
open my $fh, '>', 'password_hash.txt' or die "Could not open file: $!";
print $fh $hash;
close $fh;

#Prompts user to enter password and compare with stored hash:
print "Enter password to verify: ";
my $verify_password = <STDIN>;
chomp $verify_password;
my $verify_hash = Digest::MD5::md5_hex($verify_password);

open my $fh2, '<', 'password_hash.txt' or die "Could not open file: $!";
my $stored_hash = <$fh2>;
chomp $stored_hash;
close $fh2;

if ($verify_hash eq $stored_hash) {
    print "Password is correct!\n";
} else {
    print "Password is incorrect.\n";
}
