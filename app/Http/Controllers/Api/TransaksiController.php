<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Transaksi;
use App\Models\Barang;
use Illuminate\Support\Facades\DB;

class TransaksiController extends Controller
{
    public function index()
    {
        return Transaksi::with('barang')->get();
    }

    public function store(Request $request)
    {
         $data = $request->validate([
            'id_barang' => 'required|exists:barang,id',
            'tanggal' => 'required|date',
            'jumlah' => 'required|integer',
            'tipe_transaksi' => 'required|in:masuk,keluar',
            'keterangan' => 'nullable|string',
        ]);
        
        return DB::transaction(function () use ($data) {
            

            // Ambil barang + transaksi sampai tanggal itu, dan kunci row-nya
            $barang = Barang::with(['transaksis' => function ($query) use ($data) {
                    $query->where('tanggal', '<=', $data['tanggal']);
                }])
                ->lockForUpdate()
                ->findOrFail($data['id_barang']);

            // Hitung stok akhir
            $totalMasuk = $barang->transaksis
                ->where('tipe_transaksi', 'masuk')
                ->sum('jumlah');

            $totalKeluar = $barang->transaksis
                ->where('tipe_transaksi', 'keluar')
                ->sum('jumlah');

            $stokAkhir = $barang->stok_awal + $totalMasuk - $totalKeluar;

            // Cek stok sebelum transaksi keluar
            if ($data['tipe_transaksi'] === 'keluar' && $data['jumlah'] > $stokAkhir) {
                return response()->json([
                    'message' => 'Stok tidak mencukupi',
                    'errors'  => [
                        'jumlah' => ['Stok tersedia: ' . $stokAkhir],
                    ],
                ], 422);
            }
            // Validasi jika jumlah minus
            if ($data['jumlah'] < 0) {
                return response()->json([
                    'message' => 'Jumlah Tidak boleh negatif',
                    'errors'  => [],
                ], 422);
            }

            // Simpan transaksi kalau aman
            $transaksi = Transaksi::create([
                'id_barang'      => $data['id_barang'],
                'tipe_transaksi' => $data['tipe_transaksi'],
                'jumlah'         => $data['jumlah'],
                'tanggal'        => $data['tanggal'],
            ]);

            return response()->json($transaksi, 201);
        });
    }
}
