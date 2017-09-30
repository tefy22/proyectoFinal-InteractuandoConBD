<?php
session_start();

require ('conectarBD.php');

$pass=$_POST['password'];
$email= $_POST['username'];
$response['conexion'] = 'Sin conexión';

if (filter_var($email, FILTER_VALIDATE_EMAIL) && !empty($pass)) {
	$con = new ConectorBD('localhost', 'nextu', '12345');
	$response['conexion'] = $con -> initConexion('agenda');
	if ($response['conexion'] == 'OK') {
		$resultado = $con -> consultar(['usuario'], ['*'], 'email="' . $email . '"');
		if ($resultado ->num_rows != 0) {
			while ($fila = $resultado -> fetch_assoc()) {
				$hashpass = $fila['contrasenna'];
				$userResult = $fila;
			}
			if (password_verify($pass, $hashpass)) {
				$_SESSION['isLogin'] = true;
				$_SESSION['userLogin'] = $userResult;
				$response['msg'] = 'OK';
			} else
				$response['msg'] = 'Contraseña incorrecta';
		} else
			$response['msg'] = 'El usuario no existe ';
	} else
		$response['msg'] = 'Problemas con la conexión a la base de datos';
	$con -> cerrarConexion();
} else
	$response['msg'] = 'Datos incorrectos';

echo json_encode($response);
?>