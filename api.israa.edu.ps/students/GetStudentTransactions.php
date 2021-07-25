<?php

require('assets/I18N/Arabic.php');
$Arabic = new I18N_Arabic('Numbers');

$serverName = "135.181.3.160"; //serverName\instanceName
$connectionInfo = array( "Database"=>"IsraData", "UID"=>"dbuser", "PWD"=>"isr@adb342!@#BKA" , "CharacterSet" => "UTF-8");
$conn = sqlsrv_connect( $serverName, $connectionInfo);

$serverName_2 = "135.181.3.160"; //serverName\instanceName
$connectionInfo_2 = array( "Database"=>"IsraaHumanResource", "UID"=>"dbuser", "PWD"=>"isr@adb342!@#BKA" , "CharacterSet" => "UTF-8");
$conn_2 = sqlsrv_connect( $serverName, $connectionInfo);

$serverName_4 = "135.181.3.160"; //serverName\instanceName
$connectionInfo_4 = array( "Database"=>"IsraaAcademic", "UID"=>"dbuser", "PWD"=>"isr@adb342!@#BKA" , "CharacterSet" => "UTF-8");
$conn_4 = sqlsrv_connect( $serverName, $connectionInfo);


if( $conn ) {
     //echo "Connection established.<br />";
}else{
     //echo "Connection could not be established.<br />";
     die( print_r( sqlsrv_errors(), true));
}
if(!isset($_GET['StudentID'])){
	die("Bad Voucher Num");
}

$sql = "SELECT [Transaction].[ID] AS TransactionID
      ,[Transaction].[StudentID]
      ,[Transaction].[SemesterID]
      ,[Transaction].[Amount]
      ,[Transaction].[AccountID]
	  ,[Transaction].[ActionID]
	  ,[Account].[AccountName]
      ,[Transaction].[InsertDate]
  FROM [IsraData].[dbo].[Transaction]
  JOIN [IsraData].[dbo].[Account] ON [Account].[ID] = [Transaction].[AccountID]
  Where [Transaction].[IsDelete] = 0
  AND [Account].[IsDelete] = 0
  AND [Transaction].[StudentID] = ?";
  
  $params = array($_GET['StudentID']);
 
$stmt = sqlsrv_query( $conn, $sql, $params);
if( $stmt === false ) {
	
     die( print_r( sqlsrv_errors(), true));
}
$detailsTable = "<table style='width:100%;border: 1px solid #000;border-collapse: collapse;'>
							<tr>
								<td style='border: 1px solid #000;text-align:center;font-weight:bold;'>#</td>
								<td style='border: 1px solid #000;text-align:center;font-weight:bold;'>الملبغ</td>
								<td style='border: 1px solid #000;text-align:center;font-weight:bold;'>البيان</td>
								<td style='border: 1px solid #000;text-align:center;font-weight:bold;'>التاريخ</td>
								<td style='border: 1px solid #000;text-align:center;font-weight:bold;'>طباعة</td>
							</tr>";
$cnt = 1;					
while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC) ) {
			$detailsTable = $detailsTable ."<tr>
				<td style='border: 1px solid #000;text-align:center;font-weight:bold'>".$cnt."</td>
				<td style='border: 1px solid #000;text-align:center;font-weight:bold'>".$row['Amount']."</td>
				<td style='border: 1px solid #000;text-align:center;font-weight:bold'>".$row['AccountName']."</td>
				<td style='border: 1px solid #000;text-align:center;font-weight:bold'>".date_format($row['InsertDate'],'Y/m/d H:i')."</td>
				<td style='border: 1px solid #000;text-align:center;font-weight:bold'>
					<a target='_blank' href='https://api.israa.edu.ps/students/printTransaction.php?TransactionID=".$row['TransactionID']."'>طباعة</a></td>
			</tr>";
			$cnt++;
		}
$detailsTable = $detailsTable ."</table>";
sqlsrv_free_stmt( $stmt);

$sql_3 = "SELECT [ID]
			  ,[StudentNo]
			  ,[ArFirstName] + ' ' + [ArSecoundName] + ' ' + [ArFamilyName] as StudentName 
			  ,[IsDelete]
		  FROM [IsraData].[dbo].[StudentData]
		   where [IsDelete] = 0
		  and [ID] = ?";
		  
		  $params_3 = array($_GET['StudentID']);
		 
		$stmt_3 = sqlsrv_query( $conn, $sql_3, $params_3);
		if( $stmt_3 === false ) {
			
			 die( print_r( sqlsrv_errors(), true));
		}
		$row_3 = sqlsrv_fetch_array( $stmt_3, SQLSRV_FETCH_ASSOC);

		if (count($row_3)>0){
			array_push($response,$row_3);
		}

		sqlsrv_free_stmt( $stmt_3);
		
		
		$sql_4 = "SELECT [StudentAcademic].[StudentID]
					  ,[Department].[ArName] as DepartmentName
					  ,[College].[ArName] as CollegeName

				  FROM [IsraaAcademic].[dbo].[StudentAcademic]
				  JOIN [IsraaAcademic].[dbo].[Department] ON [Department].[ID] = [StudentAcademic].[DepartmentID]
				  JOIN [IsraaAcademic].[dbo].[College] ON [College].[ID] = [Department].[CollegeID]
				  
				  where [StudentAcademic].[IsDelete] = 0
				  AND [Department].[IsDelete] = 0
				  AND [College].[IsDelete] = 0
				  AND [StudentAcademic].[StudentID] = ?";
		  
		  $params_4 = array($_GET['StudentID']);
		 
		$stmt_4 = sqlsrv_query( $conn_4, $sql_4, $params_4);
		if( $stmt_4 === false ) {
			
			 die( print_r( sqlsrv_errors(), true));
		}
		$row_4 = sqlsrv_fetch_array( $stmt_4, SQLSRV_FETCH_ASSOC);

		if (count($row_4)>0){
			array_push($response,$row_4);
		}

		sqlsrv_free_stmt( $stmt_4);
		

?>

<html lang="en" dir="rtl">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
    <meta charset="utf-8" />
    <title>بوابة المحاضر الإلكترونية | جامعة الإسراء</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />

	<style>
    body {
        width: 100%;
        height: 100%;
        margin: 0;
        padding: 0;		
        background-color: #CCC;
        font: 12pt "Times";
		font-weight:bold;
    }
    * {
        box-sizing: border-box;
        -moz-box-sizing: border-box;
    }
    .page {
        width: 210mm;
        min-height: 297mm;
        /*padding: 20mm;*/
        margin: 10mm auto;
        border: 1px #a3a3a3 solid;
        border-radius: 0px;
        background: white;
        box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.1);
		background-image: url("assets/imgs/background.png");

    }
    .subpage {
        padding: 4cm 2cm;
        /*border: 1px red solid;*/
        height: 296mm;
        /*outline: 2cm #FFF solid;*/
		background-image: url("assets/imgs/background.png");

    }
    
    @page {
        size: A4;
        margin: 0;
    }
    @media print {
        html, body {
            width: 210mm;
            height: 297mm;        
        }
        .page {
            margin: 0;
            border: initial;
            border-radius: initial;
            width: initial;
            min-height: initial;
            box-shadow: initial;
            background: initial;
            page-break-after: always;
        }
    }
</style>
	
</head>
<body>
	<div class="book">
		<div class="page">
			<div class="subpage">
			<div style="text-align:center;"><h2>معاملات الطالب من حساب آخر</h2></div>
			<div >رقم الطالب: <?PHP echo $row_3['StudentNo']. "&nbsp;";?></div><br>
			<div >اسم الطالب: <?PHP echo $row_3['StudentName']. "&nbsp;";?></div><br>
			<div >الكلية: <?PHP echo $row_4['CollegeName']. "&nbsp;";?></div><br>
			<div >القسم: <?PHP echo $row_4['DepartmentName']. "&nbsp;";?></div><br>
			<p></p>
			<div ><?PHP echo $detailsTable; ?></div>
			</div>
		</div>
	</div>
</body>
</html>
