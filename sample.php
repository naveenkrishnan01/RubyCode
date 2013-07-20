<?php

// Outputs all the result of shellcommand "ls", and returns
// the last output line into $last_line. Stores the return value
// of the shell command in $retval.

//$last_line = system('/home/naveen/RubyCode/oprah.rb', $retval);
//$nextline =  $last_line;
//$nextline = system('$nextline');
// Printing additional info
$cmd = "ruby oprah.rb qa";
system($cmd);
?>

