#!/usr/bin/perl
	use strict;
	use warnings;
	use GD::Simple;
	# create a new image (width, height)

        my $width;
        my $height;
        my $levels;
        my $location;
        my $num_args = $#ARGV + 1;
        if ($num_args != 4) {
         print "Using default 1 level with width=80 and height=45, for custom sizes (experimental):\nUsage: mapgen image_location width height number_of_levels \n";
        $width = 80;
	$height = 45;
	$levels=1;
        $location='./'
        }else{
         
        $location=$ARGV[0];
	$width=$ARGV[1];
        $height=$ARGV[2];
        $levels=$ARGV[3];
        }
        if($levels<1 || $width<8 || $height<8){
        print "\n rooms smaller than 8x8 are not supported, recommended is 80x45. There should be atleast one level generated. \n"

}

        my $num;
        my @img;
        for($num=1;$num<=$levels;$num++){
	$img[$levels] = GD::Simple->new($width, $height);
	
	
	my $unusedx = $width;
	my $unusedy = $height;
	my $range = $width/10;
	my $minimum = $width/16;
	
	while($unusedx>-2){
	our $roomwidtha = int(rand($range)) + $minimum  + 2;
	my $px = $width - $unusedx;
	
	my $py='0';
	my $unusedy=$height;
	while($unusedy>-2){
	my $roomlength = int(rand($range)) + $minimum;
	my $roomwidth = int(rand($roomwidtha-$minimum-2)) + $minimum ;
	my $py = $height - $unusedy;
	my $gravity = int(rand(2)); 
        if($gravity==1){
        $px = $width - $unusedx + $roomwidtha - $roomwidth;
        }else{ $px = $width - $unusedx; }
	
	room($px,$py,$roomwidth+$px,$roomlength+$py,undef,'black');
	$unusedy = $unusedy - $roomlength;
	
	}
	
	$unusedx = $unusedx - $roomwidtha;
	
	
	}
	
        #draw walls
	$img[$levels]->bgcolor(undef);
	$img[$levels]->fgcolor('black');
	$img[$levels]->rectangle(0, 0, $width-1, $height-1); # (top_left_x, top_left_y, bottom_right_x, bottom_right_y)
        
        #draw spawn
        if($num==1){
	my $dotx = int(rand($width-4)) + 2;
	$img[$levels]->bgcolor(undef);
	$img[$levels]->fgcolor('yellow');
	my $doty = int(rand($height-4)) + 2;
	$img[$levels]->rectangle($dotx, $doty, $dotx, $doty); # (top_left_x, top_left_y, bottom_right_x, bottom_right_y)

	my $downx = int(rand($width-4)) + 2;
	my $downy = int(rand($height-4)) + 2;
	$img[$levels]->bgcolor(undef);
	$img[$levels]->fgcolor('blue');
	$img[$levels]->rectangle($downx, $downy, $downx, $downy); # (top_left_x, top_left_y, bottom_right_x, bottom_right_y)
        
        }else{
	my $downx = int(rand($width-4)) + 2;
	my $downy = int(rand($height-4)) + 2;
	$img[$levels]->bgcolor(undef);
	$img[$levels]->fgcolor('blue');
	$img[$levels]->rectangle($downx, $downy, $downx, $downy); # (top_left_x, top_left_y, bottom_right_x, bottom_right_y)

      	my $upx = int(rand($width-4)) + 2;
	my $upy = int(rand($height-4)) + 2;
	$img[$levels]->bgcolor(undef);
	$img[$levels]->fgcolor('orange');
	$img[$levels]->rectangle($upx, $upy, $upx, $upy); # (top_left_x, top_left_y, bottom_right_x, bottom_right_y)
        
        }	
	
	sub room{
	my ($tx,$ty,$bx,$by,$bg,$fg) = @_;
	$img[$levels]->bgcolor($bg);
	$img[$levels]->fgcolor($fg);
	$img[$levels]->rectangle($tx, $ty, $bx, $by); # (top_left_x, top_left_y, bottom_right_x, bottom_right_y)
	# ($x1, $y1, $x2, $y2)
	my $doors = int(rand('4')) + 1;
	
	while($doors>='0'){
	my $side = int(rand('4'));
	if($side=='0'){
	$range=$bx-$tx-1;
	my $dot = int(rand($range)) + $tx + 1;
	$img[$levels]->fgcolor('red');
	$img[$levels]->rectangle($dot, $ty, $dot, $ty); # (top_left_x, top_left_y, bottom_right_x, bottom_right_y)
	}
	
	if($side=='1'){
	$range=$bx-$tx-1;
	my $dot = int(rand($range)) + $tx + 1;
	$img[$levels]->fgcolor('red');
	$img[$levels]->rectangle($dot, $by, $dot, $by); # (top_left_x, top_left_y, bottom_right_x, bottom_right_y)
	}
	
	if($side=='2'){
	$range=$by-$ty-1;
	my $dot = int(rand($range)) + $ty + 1;
	$img[$levels]->fgcolor('green');
	$img[$levels]->rectangle($tx, $dot, $tx, $dot); # (top_left_x, top_left_y, bottom_right_x, bottom_right_y)
	}

	if($side=='3'){
	$range=$by-$ty-1;
	my $dot = int(rand($range)) + $ty + 1;
	$img[$levels]->fgcolor('green');
	$img[$levels]->rectangle($bx, $dot, $bx, $dot); # (top_left_x, top_left_y, bottom_right_x, bottom_right_y)
	}
        $doors-=1;
	}
	}
	
	# convert into png data
	open my $out, '>', "$location/level$num.png" or die;
	binmode $out;
	print $out $img[$levels]->png;
        }
