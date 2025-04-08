package Mo::utils::Number::Utils;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;

Readonly::Array our @EXPORT_OK => qw(sub_check_percent);

our $VERSION = 0.01;

sub sub_check_percent {
	my ($value, $key, $func, $error_value) = @_;

	if (! defined $error_value) {
		$error_value = $value;
	}

	if (! defined $func) {
		$func = 'percent value';
	}

	# Check percent sign.
	if ($value =~ m/^(\d+(?:\.\d+)?)(\%)?$/ms) {
		$value = $1;
		my $p = $2;
		if (! $p) {
			err "Parameter '$key' has bad $func (missing %).",
				'Value', $error_value,
			;
		}
	# Check percent number.
	} else {
		err "Parameter '$key' has bad $func.",
			'Value', $error_value,
		;
	}

	# Check percent value.
	if ($value > 100) {
		err "Parameter '$key' has bad $func.",
			'Value', $error_value,
		;
	}

	return;
}

1;

__END__
