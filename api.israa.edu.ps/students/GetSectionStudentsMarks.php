<?php
$serverName = "135.181.3.160"; //serverName\instanceName
$connectionInfo = array( "Database"=>"IsraaAcademic", "UID"=>"dbuser", "PWD"=>"isr@adb342!@#BKA", "CharacterSet" => "UTF-8");
$conn = sqlsrv_connect( $serverName, $connectionInfo);
			/**
				Test if the the connection established to the SQL-SERVER DB
			**/
if( $conn ) {
     //echo "Connection established.<br />";
}else{
     //echo "Connection could not be established.<br />";
     die( print_r( sqlsrv_errors(), true));
}

$response = array();
			/**
				Test if section ID is arrived from client
			**/
if(isset($_GET['sectionID'])){
			/**
				Select the Semester ID of the section comes from client
				@return SemesterID
			**/
	$sql = "SELECT [Section].[ID]
			,[Section].[OfferdCourseID]
			,[OfferdCourse].[SemesterID] AS SemesterID
			,[Section].[IsDelete]
		  FROM [IsraaAcademic].[dbo].[Section]
		  JOIN [IsraaAcademic].[dbo].[OfferdCourse] ON [OfferdCourse].[ID] = [Section].[OfferdCourseID]
		  WHERE [Section].[IsDelete] = 0
				AND [OfferdCourse].[IsDelete] = 0
				AND [Section].[ID] = ? ";
	if(isset($_GET['sectionID'])) $params = array($_GET['sectionID']);
			/**
				Execute the SQL statement $sql
				@return Student Marks
			**/
	$stmt = sqlsrv_query( $conn, $sql, $params);
		
		if( $stmt === false ) {
			
			 die( print_r( sqlsrv_errors(), true));
		}
		
	$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC);
			/**
				Store the semester ID in variable				
			**/
	$currentSemesterID = $row['SemesterID']; 
	
	$sql = "SELECT [Mark].[StdSectionID] as StdSectionId
				  ,[Mark].[ID] as MarkId
				  ,[Mark].[WorkMark] as WorkMark
				  ,[Mark].[MidtermMark] as MidtermMark
				  ,[Mark].[FinalMark]as FinalMark
				  ,[Mark].[TotalMark] as TotalMark
				  ,[Mark].[TeacherAccreditation] as finalTeacherAccreditation
				  ,[Mark].[MidTeacherAccreditation] as midTeacherAccreditation
				  ,[Mark].[HeadAccreditation] as finalHeadAccreditation
				  ,[Mark].[MidHeadAccreditation] as midHeadAccreditation
				  ,[Mark].[DeanAccreditation] as finalDeanAccreditation
				  ,[Mark].[MidDeanAccreditation] as midDeanAccreditation
				  ,[Mark].[AcademicAccreditation] as finalAcademicAccreditation
				  ,[Mark].[MidAcademicAccreditation] as midAcademicAccreditation
				  ,[StdSection].[StudentID] as StudentID
				  ,([StudentPersonal].[ArFirstName] + ' ' + 
				   [StudentPersonal].[ArSecoundName] + ' ' + 
				   [StudentPersonal].[ArThirdName] + ' ' + 
				   [StudentPersonal].[ArFamilyName]) as StudentName
				  ,[StudentAcademic].[StudentNo] as StudentNo
				  ,[Mark].[IsMidtermNoMark] as IsMidtermNoMark
				  ,[Mark].[IsFinalNoMark] as IsFinalNoMark
				  ,[OfferdCourse].[OfferdCourseTypeID] as OfferdCourseTypeID
				  ,[Course].[ID] as CourseID
				  ,[Course].[CourseType] as CourseTypeID
				  ,[StdSection].[IsRemedialCourse] as IsRemedialCourse
				  ,(IIF([Mark].[MidtermMarkEmployeeID] > 0, 1 ,0)) as IsInsertMidtermMark
				  ,(IIF(([Mark].[TotalMark]>=50 AND [StudentAcademic].[ProgramID] = 1) OR
						([Mark].[TotalMark]>=60 AND [StudentAcademic].[ProgramID] = 2) , 1, 0)) as IsSuccess
				  ,[Mark].[IsMidtermIncomplete] as IsMidtermIncomplete
				  ,[Mark].[IsMidtermNoMarkAccept] as IsMidtermNoMarkAccept
				  ,[Mark].[IsMidtermZero] as IsMidtermZero
				  ,[Mark].[IsFinalNoMarkAccept] as IsFinalNoMarkAccept
				  ,[Mark].[IsFinalZero] as IsFinalZero
				  ,[Mark].[IsFinalIncomplete] as IsFinalIncomplete
				  ,[Mark].[Note] as Note
				  ,[Mark].[SectionID] as SectionID
				  ,[Mark].[HasEdit]
				  ,[Mark].[IsDelete]

			FROM [IsraaAcademic].[dbo].[Mark]
			JOIN [IsraaAcademic].[dbo].[StdSection] ON [StdSection].[ID] = [Mark].[StdSectionID]  
			JOIN [IsraaAcademic].[dbo].[StudentAcademic] ON [StudentAcademic].[StudentID] = [StdSection].[StudentID] 
			JOIN [IsraaAcademic].[dbo].[StudentPersonal] ON [StudentPersonal].[StudentID] = [StdSection].[StudentID]
			JOIN [IsraaAcademic].[dbo].[OfferdCourse] ON [OfferdCourse].[CourseID] = [StdSection].[CourseID]
			JOIN [IsraaAcademic].[dbo].[Course] ON [Course].[ID] = [StdSection].[CourseID]

			where [Mark].[IsDelete] = 0
			and [StdSection].[IsDelete] = 0
			and [StudentAcademic].[IsDelete] = 0
			and [StudentPersonal].[IsDelete] = 0
			and [OfferdCourse].[IsDelete] = 0
			and [Course].[IsDelete] = 0
			and [Mark].[HasEdit] = 0
			and [StdSection].[CourseStatusID] in (1,6,7,11)
			and [Mark].[SectionID] = ? 
			and [OfferdCourse].[SemesterID] = ?

			order by StudentName ASC";

			/**
				Test if section ID is arrived from client
			**/
		if(isset($_GET['sectionID'])) $params = array($_GET['sectionID'],$currentSemesterID);
		
		$stmt = sqlsrv_query( $conn, $sql, $params);
			/**
				Test if data retrived
			**/
		if( $stmt === false ) {
			
			 die( print_r( sqlsrv_errors(), true));
		}

		//$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC);
			
		while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC) ) {
			/**
				Loop to retrive the students marks
				push all students marks into array
			**/
			array_push($response,$row);			
		}
			/**
				Clear memory and close the sql
			**/
		sqlsrv_free_stmt( $stmt);
			/**
				Send the students marks to the client
			**/
		echo json_encode($response);
}else{
		sqlsrv_free_stmt( $stmt);
			/**
				If no data retrived 
				Send error to the client
			**/
		$response = array("status"=>0, "message"=>"Bad section ID");
		echo json_encode($response);
}
		

?>