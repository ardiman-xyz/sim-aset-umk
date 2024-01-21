<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;

class DashboardController extends Controller
{
    public function index()
    {
        $assetsPerMonth = DB::table('assets')
            ->selectRaw("DATE_FORMAT(date_of_purchase, '%M') as month")
            ->selectRaw("SUM(quantity) as total_quantity")
            ->groupBy('month') 
            ->orderByRaw("FIND_IN_SET(month, 'Januari,Februari,Maret,April,Mei,Juni,Juli,Agustus,September,Oktober,November,Desember')")
            ->get(); 

        return Inertia::render('Dashboard/Index', [
            'assetsPerMonth' => $assetsPerMonth
        ]);
    }

    public function resultData(Request $request) 
    {
        $grouping = $request->query('grouping');

        if($grouping === 'month') {

            return $this->_getByMonth();
        }
        

        else if($grouping === 'year') {
           return $this->_getByYear();
        }
        
    }

    private function _getByMonth()
    {   
        $assets = DB::table('assets')
            ->selectRaw("DATE_FORMAT(date_of_purchase, '%M') as period")
            ->selectRaw("SUM(quantity) as total_quantity")
            ->groupBy('period') 
            ->orderByRaw("FIND_IN_SET(period, 'Januari,Februari,Maret,April,Mei,Juni,Juli,Agustus,September,Oktober,November,Desember')")
            ->get(); 

        return response()->json([
            'status' => true,
            'message' => 'Successfully get data!',
            'data' => $assets
        ], 200);
    }

    private function _getByYear()
    {
        $assets = DB::table('assets')
        ->selectRaw("YEAR(date_of_purchase) as period") 
        ->selectRaw("SUM(quantity) as total_quantity")
        ->groupBy('period')
        ->orderBy('period')
        ->get();

        return response()->json([
            'status' => true,  
            'message' => 'Successfully get data!',
            'data' => $assets
        ], 200);
    }

}
