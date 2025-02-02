<?php
session_start();
session_destroy();

echo "Logging out....";
echo '<script>window.location.href = "../index.html"; </script>';
?>