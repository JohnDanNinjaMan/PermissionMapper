#!/usr/bin/ruby
# Script to re-map permissions of directories and files based on current permissions.

def currentPermissions(file)
	file.stat.mode.to_s(8).chars.last(3)
end

def setITSPermissions(file)
	permissions = currentPermissions(file)
	# Need to set group permissions to the same as world permissions
	migratedPermissions = "0" + permissions[0] + permissions[2] + permissions[2]
        # puts migratedPermissions.to_i(8)
	file.chmod(migratedPermissions.to_i(8))
        # puts file.stat.mode.to_s(8)
end

filename=ARGV[0]
file=File.open(filename)
setITSPermissions(file)
puts file.stat.mode.to_s(8)
