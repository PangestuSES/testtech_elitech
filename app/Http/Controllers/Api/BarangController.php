<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Barang;
use Illuminate\Support\Facades\Log;

class BarangController extends Controller
{
    public function index(Request $request)
    {
        return Barang::all();
    }

    public function store(Request $request)
    {
        $request->validate([
            'kode_barang' => 'required|unique:barang',
            'nama_barang' => 'required',
            'satuan' => 'required',
            'stok_awal' => 'required|integer',
        ]);

        $barang = Barang::create($request->all());
        return response()->json($barang, 201);
    }

    public function update(Request $request, $id)
    {
        $barang = Barang::findOrFail($id);
        $barang->update($request->all());
        return response()->json($barang);
    }

    public function destroy($id)
    {
        Barang::destroy($id);
        return response()->json(null, 204);
    }



    public function stokAkhir(Request $request)
    {
        $tanggal = $request->query('tanggal', now()->toDateString()); // Mendapatkan parameter tanggal
        $perpage = $request->query('per_page', 10); // Mendapatkan count data per page
        $page = $request->query('page', 1); // Mendapatkan page ke berapa

        $barang = Barang::with(['transaksis' => function($query) use ($tanggal) {
            $query->select('id_barang', 'tipe_transaksi', 'jumlah')
            ->where('tanggal', '<=', $tanggal);
        }])
        ->paginate(
            $perpage,       // per page
            ['*'],          // columns
            'page',         // page parameter name
            $page           // current page
        )
        ->through(function($item) { 
            // Separate 'masuk' and 'keluar' transactions
            $totalMasuk = $item
                ->transaksis
                ->where('tipe_transaksi', 'masuk')
                ->sum('jumlah');

            $totalKeluar = $item
            ->transaksis
                ->where('tipe_transaksi', 'keluar')
                ->sum('jumlah');

            // Calculate the latest stock
            $item->stok_akhir = $item->stok_awal + $totalMasuk - $totalKeluar;

            return $item;
        });

        return response()->json($barang);
    }



}
