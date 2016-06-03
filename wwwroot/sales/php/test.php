<?php 
ini_set("log_errors", 1);
ini_set("error_log", getcwd() . "\\error.log");

if(@mkdir("D:\\HOSTINGSPACES\\vacumakt\\vac-u-max.com\\wwwroot\\sales\\Sales Automation\\testerdir")){
    echo "Mkdir OK...";
   
} else {
      echo "Mkdir failed...";
    echo var_dump(  error_get_last());
}
?>