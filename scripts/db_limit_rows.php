<?php
$servername = "localhost";
$username = "root";
$password = "password";
$dbname = "check";
// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
// Query
mysqli_query($conn, "DELETE FROM log WHERE date NOT IN ( SELECT date FROM ( SELECT date FROM log ORDER BY date DESC LIMIT 90 ) sectable );");
$conn->close();
?>
