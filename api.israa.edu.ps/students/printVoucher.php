
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
if(!isset($_GET['VoucherNum'])){
	die("Bad Voucher Num");
}

$sql = "SELECT TOP (1) [Voucher].[ID] AS VoucherID
			  ,[Voucher].[StudentID] AS StudentID
			  ,[Voucher].[VoucherNum] AS VoucherNum
			  ,[Voucher].[TotalAmount] AS TotalAmount
			  ,[Action].[ArName] AS VoucherDetails
			  ,[Voucher].[ActionID]
			  ,[Voucher].[VoucherTypeID]
			  ,[Voucher].[Note]
			  ,[Voucher].[IsDelete]
			  ,[Voucher].[InsertDate] AS VoucherDate
			  ,[Voucher].[InsertEmployeeID]
  FROM [IsraData].[dbo].[Voucher]
  JOIN [IsraData].[dbo].[Action] ON [Action].[ID] = [Voucher].[ActionID]
  where [Voucher].[IsDelete] = 0
  and [Action].[IsDelete] = 0
  and [VoucherNum] = ?
  ORDER BY [Voucher].[ID] DESC";
  
  $params = array($_GET['VoucherNum']);
 
$stmt = sqlsrv_query( $conn, $sql, $params);
if( $stmt === false ) {
	
     die( print_r( sqlsrv_errors(), true));
}
$response = array();
$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC);
if (count($row)<1){
	//die( print_r( sqlsrv_errors(), true));
}else{
	array_push($response,$row);

	sqlsrv_free_stmt( $stmt);

		$sql_2 = "SELECT [EmployeeID]
					  ,[EmployeeNo]
					  ,[ArFirstName] + ' ' + [ArSecoundName] + ' ' + [ArFamilyName] as EmpName 
					  ,[IsDelete]
				  FROM [IsraaHumanResource].[dbo].[EmployeePersonal]
				   where [IsDelete] = 0
				  and [EmployeeID] = ?";
		  
		  $params_2 = array($row['InsertEmployeeID']);
		 
		$stmt_2 = sqlsrv_query( $conn_2, $sql_2, $params_2);
		if( $stmt_2 === false ) {
			
			 die( print_r( sqlsrv_errors(), true));
		}
		$row_2 = sqlsrv_fetch_array( $stmt_2, SQLSRV_FETCH_ASSOC);

		if (count($row_2)>0){
			array_push($response,$row_2);
		}

		sqlsrv_free_stmt( $stmt_2);

		$sql_3 = "SELECT [ID]
					  ,[StudentNo]
					  ,[ArFirstName] + ' ' + [ArSecoundName] + ' ' + [ArFamilyName] as StudentName 
					  ,[IsDelete]
				  FROM [IsraData].[dbo].[StudentData]
				   where [IsDelete] = 0
				  and [ID] = ?";
		  
		  $params_3 = array($row['StudentID']);
		 
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
		  
		  $params_4 = array($row['StudentID']);
		 
		$stmt_4 = sqlsrv_query( $conn_4, $sql_4, $params_4);
		if( $stmt_4 === false ) {
			
			 die( print_r( sqlsrv_errors(), true));
		}
		$row_4 = sqlsrv_fetch_array( $stmt_4, SQLSRV_FETCH_ASSOC);

		if (count($row_4)>0){
			array_push($response,$row_4);
		}

		sqlsrv_free_stmt( $stmt_4);
		
		$sql_5 = "SELECT [VoucherDetails].[ID]
					  ,[VoucherDetails].[VoucherID]
					  ,[VoucherDetails].[Amount]
					  ,[VoucherDetails].[CurrencyID]
					  ,[Currency].[ArName] As CurrencyName
					  ,[VoucherDetails].[CurrencyPriceID]
					  ,[VoucherDetails].[IsDelete]
				  FROM [IsraData].[dbo].[VoucherDetails]
				  JOIN [IsraData].[dbo].[Currency] ON [Currency].[ID] = [VoucherDetails].[CurrencyID]
				  where [VoucherDetails].[IsDelete] = 0
				  AND [Currency].[IsDelete] = 0
				  AND [VoucherDetails].[VoucherID] = ?";
		  
		  $params_5 = array($row['VoucherID']);
		 
		$stmt_5 = sqlsrv_query( $conn, $sql_5, $params_5);
		if( $stmt_5 === false ) {
			
			 die( print_r( sqlsrv_errors(), true));
		}
		//$row_5= sqlsrv_fetch_array( $stmt_5, SQLSRV_FETCH_ASSOC);

		$detailsTable = "<table style='border: 1px solid #000; width:7cm;border-collapse: collapse;'>
							<tr>
								<td style='border: 1px solid #000;text-align:center;font-weight:bold;width:3cm;'>المبلغ</td>
								<td style='border: 1px solid #000;text-align:center;font-weight:bold;width:4cm;'>العملة</td>
							</tr>";
		while( $row_5 = sqlsrv_fetch_array( $stmt_5, SQLSRV_FETCH_ASSOC) ) {
			$detailsTable = $detailsTable ."<tr>
				<td style='border: 1px solid #000;text-align:center;font-weight:bold'>".$row_5['Amount']."</td>
				<td style='border: 1px solid #000;text-align:center;font-weight:bold'>".$row_5['CurrencyName']."</td>
			</tr>";
		}
		$detailsTable = $detailsTable ."</table>";
		sqlsrv_free_stmt( $stmt_5);
		
		

		$decimalToChar = "";
		$fractionToChar = "";
		$decimalAmount = intval($row['TotalAmount']);
		$foundDecimalAmount = false;
		if($decimalAmount > 0){
			$decimalToChar = $Arabic->int2str($decimalAmount). " دينار أردني";
			$foundDecimalAmount = true;
		}
		
		$amountFraction = (floatval($row['TotalAmount']) - intval($row['TotalAmount']));
		if($amountFraction > 0){
			$amountFraction = $amountFraction * 100;
			if($foundDecimalAmount) $fractionToChar = $fractionToChar." و";
			$fractionToChar = $fractionToChar." ".$Arabic->int2str($amountFraction). " قرش";			
		}		
		
		$numbersToChar = $decimalToChar.$fractionToChar;
		
		
		
		
		
		
}
//echo json_encode($response);

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
    }
    .subpage {
        padding: 1cm;
        /*border: 1px red solid;*/
        height: 296mm;
        /*outline: 2cm #FFF solid;*/
		<?PHP if($row['ActionID'] == 152){?>
			background-image: url("assets/imgs/TransVoucherbackground.jpg");
		<?PHP }else{?>
			background-image: url("assets/imgs/ReceiptVoucherbackgroundCopy.jpg");
		<?PHP }?>
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
			<div style="width: 40mm;text-align: right;position: relative;top: 119px;right: 124px;"><?PHP echo $row_3['StudentNo']. "&nbsp;";?></div>
			<div style="width: 139px;text-align: right;position: relative;top: 101px;right: 314px;"><?PHP echo $row_3['StudentName']. "&nbsp;";?></div>
			<div style="width: 100;text-align: right;position: relative;top: 94px;right: 618px;"><?PHP echo $row['VoucherNum']. "&nbsp;";?></div>
			<div style="width: 200px;text-align: right;position: relative;top: 96px;right: 115px;"><?PHP echo $row_4['CollegeName']. "&nbsp;";?></div>
			<div style="width: 200;text-align: right;position: relative;top: 78px;right: 314px;"><?PHP echo $row_4['DepartmentName']. "&nbsp;";?></div>
			<div style="width: 100;text-align: right;position: relative;top: 72px;right: 616px;"><?PHP echo date_format($row['VoucherDate'],'Y/m/d'). "&nbsp;";?></div>
			<div style="width: 400px;text-align: right;position: relative;top: 126px;right: 147px;"><?PHP echo $row['VoucherDetails']. "&nbsp;";?></div>
			<div style="width: 400px;text-align: right;position: relative;top: 144px;right: 150px;"><?PHP echo $row['TotalAmount']. "&nbsp;دينار أردني";?></div>
			<div style="width: 400px;text-align: right;position: relative;top: 159px;right: 149px;"><?PHP echo $numbersToChar;?></div>
			<div style="width: 40px; height: 100px;text-align: right;position: relative;top: 181px;right: 148px;"><?PHP echo $detailsTable;?></div>
			<div style="width: 400px;text-align: right;position: relative;top: 163px;right: 38px;"><?PHP echo $row['Notes']. "&nbsp;";?></div>
			<div style="width: 200px;text-align: center;position: relative;top: 154px;right: 540px;"><?PHP echo $row_2['EmpName']. "&nbsp;";?></div>
			
			<div style="width: 40mm;text-align: right;position: relative;top: 389px;right: 124px;"><?PHP echo $row_3['StudentNo']. "&nbsp;";?></div>
			<div style="width: 139px;text-align: right;position: relative;top: 371px;right: 314px;"><?PHP echo $row_3['StudentName']. "&nbsp;";?></div>
			<div style="width: 100;text-align: right;position: relative;top: 362px;right: 618px;"><?PHP echo $row['VoucherNum']. "&nbsp;";?></div>
			<div style="width: 200px;text-align: right;position: relative;top: 367px;right: 115px;"><?PHP echo $row_4['CollegeName']. "&nbsp;";?></div>
			<div style="width: 200;text-align: right;position: relative;top: 348px;right: 314px;"><?PHP echo $row_4['DepartmentName']. "&nbsp;";?></div>
			<div style="width: 100;text-align: right;position: relative;top: 343px;right: 616px;"><?PHP echo date_format($row['VoucherDate'],'Y/m/d'). "&nbsp;";?></div>
			<div style="width: 400px;text-align: right;position: relative;top: 403px;right: 147px;"><?PHP echo $row['VoucherDetails']. "&nbsp;";?></div>
			<div style="width: 400px;text-align: right;position: relative;top: 420px;right: 150px;"><?PHP echo $row['TotalAmount']. "&nbsp;دينار أردني";?></div>
			<div style="width: 400px;text-align: right;position: relative;top: 436px;right: 149px;"><?PHP echo $numbersToChar;?></div>
			<div style="width: 40px; height: 100px;text-align: right;position: relative;top: 458px;right: 148px;"><?PHP echo $detailsTable;?></div>
			<div style="width: 400px;text-align: right;position: relative;top: 432px;right: 38px;"><?PHP echo $row['Notes']. "&nbsp;";?></div>
			<div style="width: 200px;text-align: center;position: relative;top: 424px;right: 540px;"><?PHP echo $row_2['EmpName']. "&nbsp;";?></div>
			
		</div>
    </div>
</div>
</body>
</html>