<?php
include '.php';



if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recibir y sanitizar los datos del formulario
    $nombre = $conn->real_escape_string($_POST['usu']);
    $apellidos = $conn->real_escape_string($_POST['ap']);
    $clave = password_hash($conn->real_escape_string($_POST['clave']), PASSWORD_DEFAULT); // Encriptar clave
    $numero_documento = $conn->real_escape_string($_POST['ti']);
    $tipo_documento = $conn->real_escape_string($_POST['tip-doc']);
    $grupo = $conn->real_escape_string($_POST['tip-g']);

    // Validación simple
    if (empty($nombre) || empty($apellidos) || empty($clave) || empty($numero_documento)) {
        echo "Por favor, completa todos los campos.";
    } else {
        // Insertar los datos en la base de datos
        $sql = "INSERT INTO registros (nombre, apellidos, clave, numero_documento, tipo_documento, grupo) 
                VALUES ('$nombre', '$apellidos', '$clave', '$numero_documento', '$tipo_documento', '$grupo')";

        if ($conn->query($sql) === TRUE) {
            echo "Registro exitoso";
            header(header: "Location: ingreso.html");  // Redirigir a la página de inicio
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
}

$conn->close();
?>
