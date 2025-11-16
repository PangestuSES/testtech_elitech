<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Barang extends Model
{
    use HasFactory;
    protected $table = 'barang';

    protected $fillable = ['kode_barang', 'nama_barang', 'satuan', 'stok_awal'];

    // protected $appends = ['stok_akhir'];
    public function transaksis()
    {
        return $this->hasMany(Transaksi::class, 'id_barang');
    }

    // hitung stok akhir
    // public function getStokAkhirAttribute()
    // {
    //     $masuk = $this->transaksis()->where('tipe_transaksi', 'masuk')->sum('jumlah');
    //     $keluar = $this->transaksis()->where('tipe_transaksi', 'keluar')->sum('jumlah');
    //     return $this->stok_awal + $masuk - $keluar;
    // }
}
