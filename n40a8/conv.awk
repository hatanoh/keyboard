BEGIN {
	#FS=","
	OFS=","
	ox=-0.635
	oy=3.81
	pi=3.1415926535
	print "Designator,Mid X,Mid Y,Rotation,Layer"
}

{
	x=$4+0
	y=$5+0
	r=(-$6)%360
	if ($2 == "TPS61221") r+=270;
	if ($2 ~ /^CPG151101S11.*/) {
		s=-r*pi/180
		x+=ox*cos(s)-oy*sin(s)
		y+=ox*sin(s)+oy*cos(s)
	}
	if ($0 !~ /^#/) {
		r=(r+180)%360
		print $1,x,y,r,$7
	}
}

