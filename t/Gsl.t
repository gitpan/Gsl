# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..5\n"; }
END {print "not ok 1\n" unless $loaded;}
use Gsl qw(:SpecialFunction );
$loaded = 1;
print "ok 1\n";

######################### End of black magic.
my $g = new Gsl::SpecialFunction;
if( $g ){ print "ok 2\n" } else { print "ok 2\n"; }

print "not ok 3\n" unless ( int (gamma( 5 )) == 24 );
print "ok 3\n";

print "not ok 4\n" unless ( lngamma( 2 ) == 0 );
print "ok 4\n";

gamma_e( 5, $g );
if( int( $g->val ) == 24 ){
	print "ok 5\n";
} else {
	print "not ok 5\n";
}

