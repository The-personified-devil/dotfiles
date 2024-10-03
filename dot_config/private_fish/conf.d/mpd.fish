#!/usr/bin/fish

function ytmpd
	echo (mpc add (youtube-dl -g -f "bestaudio" $argv[1]))
end
