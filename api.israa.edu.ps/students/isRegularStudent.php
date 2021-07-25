<?php
$serverName = "135.181.3.160"; //serverName\instanceName
$connectionInfo = array( "Database"=>"IsraaAcademic", "UID"=>"dbuser", "PWD"=>"isr@adb342!@#BKA");
$conn = sqlsrv_connect( $serverName, $connectionInfo);

if( $conn ) {
     //echo "Connection established.<br />";
}else{
     //echo "Connection could not be established.<br />";
     die( print_r( sqlsrv_errors(), true));
}

$sql = "SELECT top 1 StdStatus.id
		,StudentAcademic.StudentNo
		,ArFirstName
		,ArSecoundName
		,ArThirdName
		,ArFamilyName
		,StdStatus.StatusID As std_status
		,StdStatus.SemesterID
		,EnFirstName
		,EnSecoundName
		,EnThirdName
		,EnFamilyName
		,SSN  
		FROM StudentPersonal
		join StudentAcademic on StudentAcademic.StudentID = StudentPersonal.StudentID
		join StdStatus on StdStatus.StudentID = StudentPersonal.StudentID
		where StudentPersonal.IsDelete = 0
		and StudentAcademic.IsDelete = 0
		and StdStatus.IsActive = 1
		and StdStatus.IsDelete = 0 ";
		if(isset($_GET['st_no'])) $sql = $sql."and StudentAcademic.StudentNo LIKE ? ";//.$_GET['st_no']."'";
		if(isset($_GET['st_ssn'])) $sql = $sql."and StudentPersonal.SSN LIKE ? ";//.$_GET['st_ssn']."'";
		$sql = $sql."order by StdStatus.id desc";
		
		if(isset($_GET['st_no']) && isset($_GET['st_ssn'])) $params = array($_GET['st_no'], $_GET['st_ssn']);
		else if(isset($_GET['st_no'])) $params = array($_GET['st_no']);
			else if(isset($_GET['st_ssn'])) $params = array($_GET['st_ssn']);
		

$stmt = sqlsrv_query( $conn, $sql, $params);
if( $stmt === false ) {
	
     die( print_r( sqlsrv_errors(), true));
}

$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC);

if (count($row)>0 && $row['std_status'] == 1){
	$response = array("isRegularStudent"=>1, "reasonCode"=>"1", "reasonDescription"=>"Regular student");
}else if (count($stmt)>0 && $row['std_status'] == 2){
	$response = array("isRegularStudent"=>1, "reasonCode"=>"2", "reasonDescription"=>"Deferred student");
}else if (count($stmt)>0 && $row['std_status'] == 3){
	$response = array("isRegularStudent"=>0, "reasonCode"=>"3", "reasonDescription"=>"Student discontinued");
}else if (count($stmt)>0 && $row['std_status'] == 4){
	$response = array("isRegularStudent"=>0, "reasonCode"=>"4", "reasonDescription"=>"Rejected student");
}else if (count($stmt)>0 && $row['std_status'] == 5){
	$response = array("isRegularStudent"=>0, "reasonCode"=>"5", "reasonDescription"=>"Student archived");
}else if (count($stmt)>0 && $row['std_status'] == 6){
	$response = array("isRegularStudent"=>0, "reasonCode"=>"6", "reasonDescription"=>"Students withdrawn");
}else if (count($stmt)>0 && $row['std_status'] == 7){
	$response = array("isRegularStudent"=>0, "reasonCode"=>"7", "reasonDescription"=>"Visiting student");
}else if (count($stmt)>0 && $row['std_status'] == 8){
	$response = array("isRegularStudent"=>0, "reasonCode"=>"8", "reasonDescription"=>"Student captive");
}else if (count($stmt)>0 && $row['std_status'] == 9){
	$response = array("isRegularStudent"=>0, "reasonCode"=>"9", "reasonDescription"=>"Martyr student");
}else if (count($stmt)>0 && $row['std_status'] == 10){
	$response = array("isRegularStudent"=>0, "reasonCode"=>"10", "reasonDescription"=>"Canceled student");
}else if (count($stmt)>0 && $row['std_status'] == 11){
	$response = array("isRegularStudent"=>0, "reasonCode"=>"11", "reasonDescription"=>"Student dismissed");
}else if (count($stmt)>0 && $row['std_status'] == 12){
	$response = array("isRegularStudent"=>0, "reasonCode"=>"12", "reasonDescription"=>"Student graduated");
}else{
	$response = array("isRegularStudent"=>0, "reasonCode"=>"13", "reasonDescription"=>"Student not found");
}

/*while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC) ) {
      echo "[[".$row['EnFirstName']."]]<br />";
}*/

sqlsrv_free_stmt( $stmt);

echo json_encode($response);
?>