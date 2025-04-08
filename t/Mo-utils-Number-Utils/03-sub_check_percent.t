use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean err_msg_hr);
use Mo::utils::Number::Utils qw(sub_check_percent);
use Test::More 'tests' => 13;
use Test::NoWarnings;

# Test.
my $ret = sub_check_percent('20%', 'key');
is($ret, undef, 'Get right percent value (20%).');

# Test.
$ret = sub_check_percent('20.5%', 'key');
is($ret, undef, 'Get right percent value (20.5%).');

# Test.
eval {
	sub_check_percent('20', 'key');
};
is($EVAL_ERROR, "Parameter 'key' has bad percent value (missing %).\n",
	"Parameter 'key' has bad value percent (missing %) (20).");
my $err_msg_hr = err_msg_hr();
is($err_msg_hr->{'Value'}, 20, 'Test error parameter (Value: 20).');
clean();

# Test.
eval {
	sub_check_percent('bad', 'key');
};
is($EVAL_ERROR, "Parameter 'key' has bad percent value.\n",
	"Parameter 'key' has bad value percent (bad).");
$err_msg_hr = err_msg_hr();
is($err_msg_hr->{'Value'}, 'bad', 'Test error parameter (Value: bad).');
clean();

# Test.
eval {
	sub_check_percent('101%', 'key');
};
is($EVAL_ERROR, "Parameter 'key' has bad percent value.\n",
	"Parameter 'key' has bad value percent (101%).");
$err_msg_hr = err_msg_hr();
is($err_msg_hr->{'Value'}, '101%', 'Test error parameter (Value: 101%).');
clean();

# Test.
eval {
	sub_check_percent('20', 'key', undef, '20 is part of value');
};
is($EVAL_ERROR, "Parameter 'key' has bad percent value (missing %).\n",
	"Parameter 'key' has bad value percent (missing %) (20, explicit error value).");
$err_msg_hr = err_msg_hr();
is($err_msg_hr->{'Value'}, '20 is part of value',
	'Test error parameter (Value: 20 is part of value).');
clean();

# Test.
eval {
	sub_check_percent('20', 'key', 'foo value');
};
is($EVAL_ERROR, "Parameter 'key' has bad foo value (missing %).\n",
	"Parameter 'key' has bad foo value (missing %) (20).");
$err_msg_hr = err_msg_hr();
is($err_msg_hr->{'Value'}, '20', 'Test error parameter (Value: 20).');
clean();
