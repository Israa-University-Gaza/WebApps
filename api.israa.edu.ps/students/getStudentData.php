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
		,StudentAcademic.StudentNo AS STDNO
		,SSN  As STDID
		,StudentAcademic.ProgramID AS CERTYPE
		,StudentAcademic.StudyLevel AS LEVEL
		,StudentData.Balance AS FEES
		,StdSemester.SemesterCumulativeGraduateGPA AS GPA
		,StudentAcademic.CurrentStatusID As STATUS
		,StdStatus.StatusID As sSTATUS
		,StudentAcademic.GraduationStatusID As graduateSTATUS
		,StdStatus.SemesterID		
		FROM IsraaAcademic.dbo.StudentPersonal
		join IsraaAcademic.dbo.StudentAcademic on StudentAcademic.StudentID = StudentPersonal.StudentID
		join IsraaAcademic.dbo.StdStatus on StdStatus.StudentID = StudentPersonal.StudentID
		join IsraaAcademic.dbo.StdSemester on StdSemester.StudentID = StudentPersonal.StudentID
		join IsraData.dbo.StudentData on StudentData.ID = StudentPersonal.StudentID
		where StudentPersonal.IsDelete = 0
		and StudentAcademic.IsDelete = 0
		and StdStatus.IsActive = 1
		and StdStatus.IsDelete = 0 ";
		//and StdSemester.SemesterID = 16 ";
		if(isset($_GET['st_no'])) $sql = $sql."and StudentAcademic.StudentNo LIKE ? ";//.$_GET['st_no']."'";
		if(isset($_GET['st_ssn'])) $sql = $sql."and StudentPersonal.SSN LIKE ? ";//.$_GET['st_ssn']."'";
		$sql = $sql."order by StdSemester.id desc";
		
		if(isset($_GET['st_no']) && isset($_GET['st_ssn'])) $params = array($_GET['st_no'], $_GET['st_ssn']);
		else if(isset($_GET['st_no'])) $params = array($_GET['st_no']);
			else if(isset($_GET['st_ssn'])) $params = array($_GET['st_ssn']);
				else die("Israa University API Error: Bad Request...");

$stmt = sqlsrv_query( $conn, $sql, $params);
if( $stmt === false ) {
	
     die( print_r( sqlsrv_errors(), true));
}
$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC);
if (count($row)>0){
	

	if($row['STATUS']){
		switch($row['STATUS']){
			case  1: $std_status = "REGULAR";break;
			case  2: $std_status = "DELAYED";break;
			case  3: $std_status = "OFF";break;
			case  6: $std_status = "WITHDRAWN";break;
			case 11: $std_status = "FIRED";break;
			case 12: $std_status = "GRADUATE";break;
			case 99: $std_status = "GRADE";break;
			default: $std_status = "UNKNOWN";break;
		}
	}else{
		switch($row['sSTATUS']){
			case  1: $std_status = "REGULAR";break;
			case  2: $std_status = "DELAYED";break;
			case  3: $std_status = "OFF";break;
			case  6: $std_status = "WITHDRAWN";break;
			case 11: $std_status = "FIRED";break;
			case 12: $std_status = "GRADUATE";break;
			case 99: $std_status = "GRADE";break;
			default: $std_status = "UNKNOWN";break;
		}
	}
	if($row['graduateSTATUS'] == 2) $std_status = "SENIOR";


	switch($row['CERTYPE']){
		case  1: $std_certype = "DEPLOMA";break;
		case  2: $std_certype = "BA";break;
		case  3: $std_certype = "POST";break;
		default: $std_certype = "UNKNOWN";break;
	}
	
	$response = array("FOUND"=>1
					 ,"STDID"=>$row['STDID']
					 ,"STDNO"=>$row['STDNO']
					 ,"STATUS"=>$std_status
					 ,"CERTYPE"=>$std_certype
					 ,"LEVEL"=>$row['LEVEL']
					 ,"GPA"=>$row['GPA']
					 ,"FEES"=>$row['FEES']
					 ,"PERCENT"=>"0"
					 );
}else{
	$response = array("FOUND"=>0, "resone"=>"Student not found");
}

/*while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC) ) {
      echo "[[".$row['EnFirstName']."]]<br />";
}*/

sqlsrv_free_stmt( $stmt);

echo json_encode($response);
?>