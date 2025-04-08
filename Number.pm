package Mo::utils::Number;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Mo::utils::Number::Utils qw(sub_check_percent);
use Readonly;

Readonly::Array our @EXPORT_OK => qw(check_int check_natural check_percent
	check_positive_natural);

our $VERSION = 0.01;

# .. -2, -1, 0, 1, 2, ...
sub check_int {
	my ($self, $key) = @_;

	_check_key($self, $key) && return;

	if ($self->{$key} !~ m/^\-?\d+$/ms) {
		err "Parameter '$key' must be a integer.",
			'Value', $self->{$key},
		;
	}

	return;
}

# 0, 1, 2 ...
sub check_natural {
	my ($self, $key) = @_;

	_check_key($self, $key) && return;

	if ($self->{$key} !~ m/^\d+$/ms) {
		err "Parameter '$key' must be a natural number.",
			'Value', $self->{$key},
		;
	}

	return;
}

sub check_percent {
	my ($self, $key) = @_;

	_check_key($self, $key) && return;

	sub_check_percent($self->{$key}, $key, 'percent value');

	return;
}

# 1, 2 ...
sub check_positive_natural {
	my ($self, $key) = @_;

	_check_key($self, $key) && return;

	if ($self->{$key} !~ m/^\d+$/ms || $self->{$key} == 0) {
		err "Parameter '$key' must be a positive natural number.",
			'Value', $self->{$key},
		;
	}

	return;
}

sub _check_key {
	my ($self, $key) = @_;

	if (! exists $self->{$key} || ! defined $self->{$key}) {
		return 1;
	}

	return 0;
}

1;

__END__
