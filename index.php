<html>
<body>
<form action="moveturtle.php" method="post">
Command: <input type="text" name="array">
<input type="submit">
</form>
<br>
</body>
</html>
<?php
//write to file
ob_start();
$send = $_POST["array"];
ob_end_flush();
$fp = fopen("turtle.txt","w");
fwrite($fp,$send);
fclose($fp);
?>
<?php
//echo any POST data
echo $_POST["array"];
?>
