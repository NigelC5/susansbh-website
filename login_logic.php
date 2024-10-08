<?php
session_start();
include('./db_connect.php');
ob_start();

if (!isset($_SESSION['system'])) {
    $system = $conn->query("SELECT * FROM system_settings LIMIT 1")->fetch_array();
    foreach ($system as $k => $v) {
        $_SESSION['system'][$k] = $v;
    }
}

ob_end_flush();
?>
