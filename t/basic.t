#! perl

print "1..3\n";

my $tmpout = "basic.out";
my $tmpin = "basic.in";

open (D, ">$tmpin");
print D << 'EOD';
Squirrel Consultancy
Duvenvoordestraat 46
2013 AG  Haarlem
EOD

close D;

@ARGV = ("-config", "labels.cfg", "-output", $tmpout, $tmpin);

{
    local (*STDOUT);
    open (STDOUT, ">$tmpout");
    require "blib/script/labels";
};

unlink $tmpin;
print "ok 1\n";
print "not " unless -s $tmpout > 400;
print "ok 2\n";

open (D, "<$tmpout");
undef $/;
my $got = <D>;
$got =~ s/[\n\r]+/ /g;
my $expect = <<'EOD';
test
%%BeginFeature: *PageSize A4
<< /DeferredMediaSelection true
   /PageSize [595.276 841.89] % 595.276 841.89
   /ImagingBBox null >> setpagedevice
%%EndFeature
%%EndSetup

%%Page: 1 1
%%BeginPageSetup
WorkDict begin save
%%EndPageSetup
% Label 1
28.35 795.75 moveto
/Fpt 0.01 def
[(Squirrel)250(Consultanc)-15(y)] TJ
28.35 781.75 moveto
[(Duv)-15(en)-40(v)-20(oordestraat)250(46)] TJ
28.35 767.75 moveto
[(2013)195(A)-40(G)250(Haarlem)] TJ
showpage restore end

%%Trailer
%%Pages: 1
%%EOF
EOD
$expect =~ s/[\n\r]+/ /g;
if ( $got eq $expect ) {
    unlink $tmpout;
}
else {
    print "not ";
}
print "ok 3\n";

__DATA__
test
