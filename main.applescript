(*
	"Sleep My Mac" script created by Erwann MEST (http://www.kud.fr).
	This script helps your mac to sleep well.
*)

(* Time in second to notice the user when it will be shutdown *)
property dialog_timeout : 5

repeat
	try
		display dialog Â
			"Minutes?" default answer "" with title "Sleep My Pretty Mac" with icon note
		set the time_amount to the text returned of the result as integer
		if the time_amount is greater than 0 then exit repeat
	on error number error_number
		if the error_number is -128 then return "User cancelled."
	end try
end repeat

if the time_amount is 1 then
	set the my_minuten to "minute"
else
	set the my_minuten to "minutes"
end if

display dialog "Shutdown in " & time_amount & " " & Â
	my_minuten & "." buttons {"Ok"} default button 1 giving up after dialog_timeout

delay time_amount * 60
tell application "Finder" to shut down