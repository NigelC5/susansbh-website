<?php
// Start the session and include required files
session_start();

if (!isset($_SESSION['login_id'])) {
    header('location:login.php');
    exit();
}

include('./header.php'); 
include 'topbar.php'; 
include 'navbar.php';

// Load the page content dynamically
$page = isset($_GET['page']) ? $_GET['page'] : 'home';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title><?php echo isset($_SESSION['system']['name']) ? $_SESSION['system']['name'] : ''; ?></title>
</head>
<body>
    <main id="view-panel">
        <?php include $page . '.php'; ?>
    </main>
</body>
</html>

<?php
include('./footer.php');
?>
