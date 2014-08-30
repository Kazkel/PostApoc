#!/usr/bin/perl
use strict;
use warnings;
use GD::Simple;
# create a new image (width, height)
my $width = 80;
my $height = 45;

my $img = GD::Simple->new($width, $height);



my $unusedx = $width;
my $unusedy = $height;
my $range = 8;
my $minimum = 4;

while($unusedx>0){
my $roomwidth = int(rand($range)) + $minimum;
my $px = $width - $unusedx;

my $py='0';
my $unusedy=$height;
while($unusedy>0){
my $roomlength = int(rand($range)) + $minimum;
my $roomwidth = int(rand($range)) + $minimum;
my $py = $height - $unusedy;

room($px,$py,$roomwidth+$px,$roomlength+$py,undef,'black');
$unusedy = $unusedy - $roomlength;


}

$unusedx = $unusedx - $roomwidth;


}

room(0,0,79,44,undef,'black');













sub room{
my ($tx,$ty,$bx,$by,$bg,$fg) = @_;
$img->bgcolor($bg);
$img->fgcolor($fg);
$img->rectangle($tx, $ty, $bx, $by); # (top_left_x, top_left_y, bottom_right_x, bottom_right_y)
# ($x1, $y1, $x2, $y2)
my $doors = int(rand('3'));

while($doors>='0'){
my $side = int(rand('3'));
if($side=='0'){
$range=$bx-$tx-1;
my $dot = int(rand($range)) + $tx + 1;
$img->fgcolor('red');
$img->rectangle($dot, $ty, $dot, $ty); # (top_left_x, top_left_y, bottom_right_x, bottom_right_y)
}

if($side=='1'){
$range=$bx-$tx-1;
my $dot = int(rand($range)) + $tx + 1;
$img->fgcolor('red');
$img->rectangle($dot, $by, $dot, $by); # (top_left_x, top_left_y, bottom_right_x, bottom_right_y)
}

if($side=='2'){
$range=$by-$ty-1;
my $dot = int(rand($range)) + $ty + 1;
$img->fgcolor('green');
$img->rectangle($tx, $dot, $tx, $dot); # (top_left_x, top_left_y, bottom_right_x, bottom_right_y)
}

if($side=='3'){
$range=$by-$ty-1;
my $dot = int(rand($range)) + $ty + 1;
$img->fgcolor('red');
$img->rectangle($bx, $dot, $bx, $dot); # (top_left_x, top_left_y, bottom_right_x, bottom_right_y)
}
$doors-=1;
}
}
 
# convert into png data
open my $out, '>', '/var/www/img.png' or die;
binmode $out;
print $out $img->png;
