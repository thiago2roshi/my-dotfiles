filebot-abs2sxe() {
	if [ -f $1]; then
		if [ -f $2]; then
			filebot -script fn:abs2sxe --q "$1" $2
		fi
	else
		echo "use: filebot-abs2sxe serie_name filename"
	fi
	      
}
