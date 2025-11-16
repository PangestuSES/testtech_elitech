<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaksi extends Model
{
    use HasFactory;

    protected $table = 'transaksi';

    protected $fillable = ['id_barang', 'tanggal', 'jumlah', 'tipe_transaksi', 'keterangan'];

    public function item()
    {
        return $this->belongsTo(Barang::class,'id_barang');
    }
}
