<?php
include '.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recibir y sanitizar los datos del formulario
    $username = $conn->real_escape_string($_POST['username']);
    $password = $conn->real_escape_string($_POST['password']);}

    // Consulta para verificar si <?php
// Incluir el archivo de conexión
include '.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $numero_documento = $_POST['username'];
    $clave = $_POST['password'];

    // Preparar la consulta para verificar el número de documento y obtener la contraseña almacenada
    $sql = "SELECT clave FROM registros WHERE numero_documento = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $numero_documento);
    $stmt->execute();
    $stmt->store_result();

    // Verificar si el número de documento existe en la base de datos
    if ($stmt->num_rows > 0) {
        $stmt->bind_result($hash_clave);
        $stmt->fetch();

        // Verificar si la contraseña ingresada coincide con la almacenada
        if (password_verify($clave, $hash_clave)) {
            echo "Inicio de sesión exitoso";
            // Redirigir a la página principal o dashboard
            header("Location: index.html");
        } else {
            echo "Contraseña incorrecta";
        }
    } else {
        echo "El número de documento no está registrado";
    }

    $stmt->close();
    $conn->close();
}
?>