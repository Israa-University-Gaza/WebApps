<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use DB;

class StudentController extends Controller
{
    //
	
	public function index(){
		
		if(DB::connection('sqlsrv')){
			$results = DB::select('select * from City');
			return $results ;
		}
		else return  "Error..";
	}
	
}
