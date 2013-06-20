<!DOCTYPE html PUBLIC "-//W3C/DTD XHTML 1.0 Transistional//EN"
  "http://www.w3.org./TR/xhtml/DTD/xhmtl1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title> Run automation script</title>

</head>

<body>
<form name="myform" action="process.php" method="POST">
 <STYLE type="text/css">
  body {color: purple; border-width: 1; border: solid; border-color: #1B9EE0;
  text-align: center;
 }
</STYLE>
  <h1> Test  Automation </h1>
 <input type="checkbox" name="testType[]" value="qa" />QA <br />
 <input type="checkbox" name="testType[]" value="staging" />STAGE <br />
<br />
<br />

<?php
   $checkType = $_POST['testType'];
     if(empty($checkType))
    {
      echo 'Please Select the Environment'; 
}
?>
<div id="buttons">
  <label>&nbsp;</label>
  <input type="submit" name="submit_but" value="Submit"/><br />

<?php
if (isSet($_POST['submit_but']))
  {
   print 'Form submitted';
 }
?>
</body>
</html>

