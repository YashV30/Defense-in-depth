<?php
$host = 'localhost';
$db = 'project';
$user = 'bhushan';
$pass = 'bhushan@123';

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
