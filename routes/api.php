<?php
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use App\Http\Controllers\Api\LoginController;
use App\Http\Controllers\Api\BarangController;
use App\Http\Controllers\Api\TransaksiController;

Route::post('/login', [LoginController::class, 'index']);
Route::post('/logout', [LoginController::class, 'logout'])->middleware('auth:sanctum');
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();});

// Group routes yang membutuhkan autentikasi
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/user', fn(Request $r)=>$r->user());
    // Master Barang
    Route::get('/items', [BarangController::class, 'index']);
    Route::post('/items', [BarangController::class, 'store']);
    Route::put('/items/{id}', [BarangController::class, 'update']);
    Route::delete('/items/{id}', [BarangController::class, 'destroy']);

    // Transaksi Barang Masuk/Keluar
    Route::get('/transactions', [TransaksiController::class, 'index']);
    Route::post('/transactions', [TransaksiController::class, 'store']);

    // Laporan Stok Akhir
    Route::get('/laporan', [BarangController::class, 'stokAkhir']);
});