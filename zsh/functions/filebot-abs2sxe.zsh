filebot-abs2sxe() {
	if [ -f $1 && -f $2]; then
			filebot -script fn:abs2sxe --q "$1" $2
	else
		echo "use: filebot-abs2sxe serie_name filename"
	fi
	      
}
