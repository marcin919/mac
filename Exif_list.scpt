on open the_files
	set exiftool_path to "/usr/local/bin/"
	set exiftool_args to "-g1 -S"
	repeat with the_file in the_files
		set exiftool_args to exiftool_args & " " & quote & POSIX path of the_file & quote
	end repeat
	set the_md to do shell script exiftool_path & "exiftool " & exiftool_args
	set textList to {}
	set tid to AppleScript's text item delimiters
	set AppleScript's text item delimiters to (return)
	set textList to text items of the_md
	set AppleScript's text item delimiters to tid
	choose from list textList with title "List Exif Metadata" with prompt "ExifTool Metadata:" OK button name "OK" cancel button name "Cancel" with multiple selections allowed and empty selection allowed
end open

on run
	set chosen_file to choose file with multiple selections allowed
	open chosen_file
end run
