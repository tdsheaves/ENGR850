#!/usr/bin/tclsh

set root_dir "./"
set paths {{Data_Types/}}

set i 0

foreach var $paths {
	
	puts $root_dir[lindex $paths $i]
	exec git add $root_dir[lindex $paths $i]
	exec git commit $root_dir[lindex $paths $i]
	incr $i

}

# exec git push origin master