use strict;
use warnings;

use Mo::utils::Number;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Mo::utils::Number::VERSION, 0.03, 'Version.');
