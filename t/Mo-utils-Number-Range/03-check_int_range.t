use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean err_msg_hr);
use Mo::utils::Number::Range qw(check_int_range);
use Readonly;
use Test::More 'tests' => 14;
use Test::NoWarnings;

Readonly::Array our @BAD_RANGES => (
	# Bad values.
	[10.0001, 1, 2],
	['foo', 1, 2],

	# Right values, but in bad range.
	[1, 2, 3],
	[2, -2, 0],
);
Readonly::Array our @RIGHT_RANGES => (
	[-2, -3, 1],
	[0, -2, 1],
	[2, 0, 2],
);

# Test.
my ($self, $ret);
foreach my $range_ar (@RIGHT_RANGES) {
	$self = {
		'key' => $range_ar->[0],
	};
	$ret = check_int_range($self, 'key', $range_ar->[1], $range_ar->[2]);
	is($ret, undef, 'Right range is present ('.$self->{'key'}.' in range '.$range_ar->[0].', '.$range_ar->[1].').');
}

# Test.
$self = {};
$ret = check_int_range($self, 'key');
is($ret, undef, 'Right not exist key.');

# Test.
$self = {
	'key' => undef,
};
$ret = check_int_range($self, 'key');
is($ret, undef, "Value is undefined, that's ok.");

my $i = 1;
foreach my $range_ar (@BAD_RANGES) {
	$self = {
		'key' => $range_ar->[0],
	};
	eval {
		check_int_range($self, 'key', $range_ar->[1], $range_ar->[2]);
	};
	if ($i < 3) {
		is($EVAL_ERROR, "Parameter 'key' must be a integer.\n",
			"Parameter 'key' must be a integer. Value is '".$range_ar->[0]."'.");
	} else {
		is($EVAL_ERROR, "Parameter 'key' must be a integer between ".$range_ar->[1]." and ".$range_ar->[2].".\n",
			"Parameter 'key' must be a integer between ".$range_ar->[1]." and ".$range_ar->[2].". Value is '".$range_ar->[0]."'.");
	}
	my $err_msg_hr = err_msg_hr();
	is($err_msg_hr->{'Value'}, $range_ar->[0], 'Test error parameter (Value: '.$range_ar->[0].').');
	clean();
	$i++;
}
