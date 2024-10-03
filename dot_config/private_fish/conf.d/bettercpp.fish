#!/usr/bin/fish

function bcpp
	set limit 25

	for i in (seq -f "%02g" 01 $limit)
		if not test -d "/tmp/bcpp-$i"
			break
		else if [ $i = $limit ]
			echo $i
			echo "Ran out of possible projects"
			exit
		end
		
	end

	cp ~/devel/template/ "/tmp/bcpp-$i" -r
	cd "/tmp/bcpp-$i"

	meson setup "-Db_sanitize=address,undefined" build/

	nvim src/main.cpp

	cd
	rm "/tmp/bcpp-$i" -r
end
