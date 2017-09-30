<?php
 
function validateDate($date, $format = 'Y-m-d H:i:s'){
    $d = DateTime::createFromFormat($format, $date);
    return $d && $d->format($format) == $date;
}

session_start();

if (isset($_SESSION['isLogin'])) {
	require 'conectarBD.php';
	$con= new ConectorBD('localhost', 'nextu', '12345');
	$response['conexion']= $con->initConexion('agenda');

	if ($response['conexion']=="OK") {

		if(validateDate($_POST['start_date'], 'Y-m-d'))
			$datos['fecha_inicio'] = $_POST['start_date'];
		if(validateDate($_POST['start_hour'], 'H:i:s'))
			$datos['hora_ini'] = $_POST['start_hour'];
		if(validateDate($_POST['end_date'], 'Y-m-d'))
			$datos['fecha_fin'] = $_POST['end_date'];
		if(validateDate($_POST['end_hour'], 'H:i:s'))
			$datos['hora_fin'] = $_POST['end_hour'];

		if ($con->actualizarRegistro('evento', $datos, 'id= '.$_POST['id'])) {
			$response['msg'] = 'OK';
		}else
			$response['msg'] = 'Se ha producido un error al guardar el evento'. $_POST['id'];
		
	}else
		$response['msg'] = 'Problemas con la conexión a la base de datos';

}else
	$response['msg']="Debe iniciar sesión";


echo json_encode($response);






?>
