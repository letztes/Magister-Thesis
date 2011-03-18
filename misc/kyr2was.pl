#!/usr/bin/perl

use warnings;
use strict;

my $INPUTFILE = "input_kyr.txt";
my $OUTPUTFILE = "output_was.txt";

my $FH;
my @kyr = qw[А а Б б В в Г г Д д Е е Ё ё Ж ж З з И и Й й К к Л л М м Н н О о П п Р р С с Т т У у Ф ф Х х Ц ц Ч ч Ш ш Щ щ Ъ ъ Ы ы Ь ь Э э Ю ю Я я « » –];
my @was = qw[A a B b V v G g D d E e E0 e0 Z1 z1 Z z I i I0 i0 K k L l M m N n O o P p R r S s T"| t"| U u F f H h C c Q q X x W w P2 p2 Y y P1 p1 E1 e1 Yu yu Ya ya < > --];

open($FH, "$INPUTFILE") or die $!;
    my $textstring = do {local $/ = <$FH>};
close($FH);

for (my $i = 0; $i < scalar(@kyr); $i++) {
    my $kyr = $kyr[$i];
    my $was = $was[$i];
    $textstring =~ s/$kyr/$was/g;
}

$textstring = '\rus{' . $textstring;
$textstring =~ s/(\s+)/}$1\\rus{/g;
#$textstring =~ s/ /}\n\n\\rus{/g;
$textstring = $textstring.'}';

print $textstring;



open($FH, ">$OUTPUTFILE") or die $!;
    print $FH $textstring;
close($FH);


