use lib '.';
use strict;
use warnings;

use inc::Module::Install;

# Definition.
abstract 'Mo utilities for numbers.';
author 'Michal Josef Spacek <skim@cpan.org>';
author_requires 'English' => 0;
author_requires 'File::Object' => 0.05;
author_requires 'Test::More' => 0;
author_requires 'Test::NoWarnings' => 0;
author_requires 'Test::Pod' => 0;
author_requires 'Test::Pod::Coverage' => 0;
license 'bsd';
name 'Mo-utils-Number';
perl_version 5.006002;
readme_from 'Number.pm';
recursive_author_tests('xt');
requires 'Error::Pure' => 0.15;
requires 'Exporter' => 0;
requires 'Readonly' => 0;
requires 'Scalar::Util' => 0;
resources 'bugtracker' => 'https://github.com/michal-josef-spacek/Mo-utils-Number/issues',
resources 'homepage' => 'https://github.com/michal-josef-spacek/Mo-utils-Number';
resources 'repository' => 'git://github.com/michal-josef-spacek/Mo-utils-Number';
test_requires 'English' => 0;
test_requires 'Error::Pure::Utils' => 0;
test_requires 'Readonly' => 0;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
tests_recursive;
version '0.06';

# Run.
WriteAll();
