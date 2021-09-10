WATERMARK:="test"
ANGLE:=45
GRAY:=0.75

watermark.ps: 
	echo "%!PS" >> $@
	echo "/cm { 28.4 mul } bind def" >> $@
	echo "/draft-Bigfont /Helvetica-Bold findfont 72 scalefont def" >> $@
	echo "/draft-copy {" >> $@
	echo "        gsave initgraphics $(GRAY) setgray" >> $@
	echo "        5 cm 10 cm moveto" >> $@
	echo "        $(ANGLE) rotate" >> $@
	echo "        draft-Bigfont setfont" >> $@
	echo "        ($(WATERMARK)) show grestore" >> $@
	echo " } def" >> $@
	echo "draft-copy showpage" >> $@
watermark: watermark.ps
	ps2pdf - - < watermark.ps > $@
