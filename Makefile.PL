# Makefile.PL -- Makefile for Text::Stickers
# Author          : Johan Vromans
# Created On      : Mon Feb  8 11:46:56 1999
# Last Modified By: Johan Vromans
# Last Modified On: Sun Feb 18 13:24:04 2001
# Update Count    : 72
# Status          : Stable

# Verify perl version.
require 5.000;

use ExtUtils::MakeMaker;

my @scripts = qw(script/labels);

WriteMakefile
  (
   NAME         => 'labels',
   AUTHOR	=> 'Johan Vromans (jvromans@squirrel.nl)',
   ABSTRACT	=> 'Print labels',
   VERSION_FROM => $scripts[0],
   PREREQ_PM	=> { 'Getopt::Long' => 2.00,
		     'PostScript::BasicTypesetter' => 1.0,
		   },
   EXE_FILES    => [ @scripts ],
   # *.pm files will be picked up automatically from ./lib
 );
