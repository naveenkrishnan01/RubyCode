<?php
 //process the submit button

  if (isSet($_POST['submit_but']))
  {
   print 'Form submitted and automation script will run now';
   $cmd = "php sample.php";
   system($cmd);
 }
?>
