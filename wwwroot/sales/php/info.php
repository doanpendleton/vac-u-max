<?php 
ini_set("log_errors", 1);
ini_set("error_log", getcwd() . "\\error.log");
error_log("INFO loaded...");
 echo phpinfo();
?>