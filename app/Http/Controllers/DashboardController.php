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

        if ($grouping === 'month') {
            $assetsByMonth = $this->_getByMonth();
        } else if ($grouping === 'year') {
            $assetsByYear = $this->_getByYear();
        }

                // Count data user
            $userCount = DB::table('users')->count();

            // Count data aset aktif
            $activeAssetCount = DB::table('assets')->count();

            // Calculate total expenditures
            $totalExpenditures = DB::table('assets')->sum('purchase_price');

        return response()->json([
            'status' => true,
            'message' => 'Successfully get data!',
            'assets' => $grouping === 'month' ? $assetsByMonth : $assetsByYear,
            'users' => $userCount,
            'activeAssets' => $activeAssetCount,
            'totalExpenditures' => $totalExpenditures,
        ], 200);
    }

    private function _getByMonth()
    {
        return DB::table('assets')
            ->selectRaw("DATE_FORMAT(date_of_purchase, '%M') as period")
            ->selectRaw("SUM(quantity) as total_quantity")
            ->groupBy('period')
            ->orderByRaw("FIND_IN_SET(period, 'Januari,Februari,Maret,April,Mei,Juni,Juli,Agustus,September,Oktober,November,Desember')")
            ->get();
    }

    private function _getByYear()
    {
        return DB::table('assets')
            ->selectRaw("DATE_FORMAT(date_of_purchase, '%Y') as period")
            ->selectRaw("SUM(quantity) as total_quantity")
            ->groupBy('period')
            ->orderBy('period')
            ->get();
    }

}
