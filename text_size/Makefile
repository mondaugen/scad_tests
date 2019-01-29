text_size.scad : text.scad
	echo -n "function text_size_offset()=[" > $@
	openscad -o /tmp/text.stl text.scad && admesh /tmp/text.stl |\
	sed -nr '/Min X/ s/Min X = *([^,]+).*$$/\1/p'\
	| bc -l >> $@
	echo -n "," >> $@
	openscad -o /tmp/text.stl text.scad && admesh /tmp/text.stl |\
	sed -nr '/Min Y/ s/Min Y = *([^,]+).*$$/\1/p'\
	| bc -l >> $@
	echo -n "," >> $@
	openscad -o /tmp/text.stl text.scad && admesh /tmp/text.stl |\
	sed -nr '/Min Z/ s/Min Z = *([^,]+).*$$/\1/p'\
	| bc -l >> $@
	echo "];" >> $@
	echo -n "function text_size_dims()=[" >> $@
	openscad -o /tmp/text.stl text.scad && admesh /tmp/text.stl |\
	sed -nr '/Min X/ s/Min X = *([^,]+), *Max X = *(.*)$$/\2 - \1/p'\
	| bc -l >> $@
	echo -n "," >> $@
	openscad -o /tmp/text.stl text.scad && admesh /tmp/text.stl |\
	sed -nr '/Min Y/ s/Min Y = *([^,]+), *Max Y = *(.*)$$/\2 - \1/p'\
	| bc -l >> $@
	echo -n "," >> $@
	openscad -o /tmp/text.stl text.scad && admesh /tmp/text.stl |\
	sed -nr '/Min Z/ s/Min Z = *([^,]+), *Max Z = *(.*)$$/\2 - \1/p'\
	| bc -l >> $@
	echo -n "];" >> $@

test_w_text : test_w_text.scad text_size.scad
	openscad test_w_text.scad

test_w_text.stl : test_w_text.scad text_size.scad
	openscad -o test_w_text.stl test_w_text.scad
