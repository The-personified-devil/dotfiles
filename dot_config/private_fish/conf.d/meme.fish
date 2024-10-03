#!/usr/bin/fish

function mdl
	yt-dlp -f "bestvideo[vcodec=vp9][ext=webm]+bestaudio[acodec=opus][ext=webm]/bestvideo+bestaudio/best" $argv[1] -o "$HOME/memes/$argv[2].%(ext)s" --no-mtime --no-playlist --merge-output-format "webm" --sponsorblock-remove "sponsor" $argv[3..]
end
