<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include '.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['usu'];
    $username = $_POST['ap'];
    $password = password_hash($_POST['clave'], PASSWORD_DEFAULT);
    $username = $_POST['ti'];
  

    // Preparar y ejecutar la consulta
    $stmt = $conn->prepare("INSERT INTO registro (Nombre, Apellido, TI, Clave) VALUES (?, ?)");
    if ($stmt === false) {
        die("Error en la preparación de la consulta: " . $conn->error);
    }
    $stmt->bind_param("ss", $username, $password);

    if ($stmt->execute()) {
        echo "Registro exitoso. <a href='login.html'>Iniciar sesión</a>";
    } else {
        echo "Error al registrar: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
} else {
    echo "Método de solicitud no permitido.";
}
?>