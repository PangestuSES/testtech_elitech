<template>
    <div class="container" style="margin-top: 80px">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <h4>Transaksi Barang</h4>
                        <hr />
                        <form @submit.prevent="submitForm">
                            <div class="mb-3">
                                <label for="barang">Barang</label>
                                <select id="barang" class="form-control" v-model="transaksi.id_barang" required>
                                    <option value="" disabled>-- Pilih Barang --</option>
                                    <option v-for="item in barangList" :key="item.id" :value="item.id">
                                        {{ item.nama_barang }}
                                    </option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="tanggal">Tanggal</label>
                                <input
                                    type="date"
                                    id="tanggal"
                                    class="form-control"
                                    v-model="transaksi.tanggal"
                                    required
                                />
                            </div>

                            <div class="mb-3">
                                <label for="tipe">Tipe Transaksi</label>
                                <select
                                    id="tipe"
                                    class="form-control"
                                    v-model="transaksi.tipe_transaksi"
                                    required
                                >
                                    <option value="masuk">Barang Masuk</option>
                                    <option value="keluar">
                                        Barang Keluar
                                    </option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="jumlah">Jumlah</label>
                                <input
                                    type="number"
                                    id="jumlah"
                                    class="form-control"
                                    v-model="transaksi.jumlah"
                                    required
                                    min="1"
                                />
                            </div>

                            <div class="mb-3">
                                <label for="keterangan">Keterangan</label>
                                <input
                                    type="text"
                                    id="keterangan"
                                    class="form-control"
                                    v-model="transaksi.keterangan"
                                />
                            </div>

                            <div class="mt-4">
                                <button
                                    type="button"
                                    @click="goBack"
                                    class="btn btn-primary"
                                >
                                    Kembali
                                </button>

                                <button type="submit" class="btn btn-success ms-4">
                                    Simpan
                                </button>
                                
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from "axios";
import Swal from "sweetalert2";

export default {
    name: "TransaksiPage",
    data() {
        return {
            loggedIn: localStorage.getItem("loggedIn"),
            token: localStorage.getItem("token"),
            transaksi: {
                id_barang: "", // ID barang yang dipilih
                tanggal: "", // Tanggal transaksi
                tipe_transaksi: "masuk", // Default transaksi masuk
                jumlah: 1, // Jumlah barang yang masuk/keluar
                keterangan: "", // Keterangan transaksi
            },
            barangList: [], // Daftar barang yang akan dipilih
        };
    },
    created() {
        // Mengambil data barang dari API saat halaman dimuat
        axios
            .get("http://localhost:8000/api/items", {
                headers: {
                    Authorization: "Bearer " + localStorage.getItem("token"),
                },
            })
            .then((response) => {
                this.barangList = response.data; // Menyimpan data barang
            })
            .catch((error) => {
                console.error("Error fetching barang data:", error);
            });
    },
    methods: {
        submitForm() {
            // Kirim data transaksi ke API
            axios
                .post(
                    "http://localhost:8000/api/transactions",
                    this.transaksi,
                    {
                        headers: {
                            Authorization:
                                "Bearer " + localStorage.getItem("token"),
                        },
                    }
                )
                .then((response) => {
                    // Setelah transaksi berhasil, perbarui stok
                    Swal.fire({
                        icon: "success",
                        title: "Berhasil",
                        text: "Transaksi berhasil disimpan.",
                        timer: 1500,
                        showConfirmButton: false,
                    });

                    this.$router.push({ name: "dashboard" }); // Kembali ke dashboard setelah transaksi berhasil
                })
                .catch((error) => {
                    const res = error.response;

                    if (res && res.status === 422) {
                        // ini kasus stok tidak mencukupi / validasi gagal
                        const msg = res.data?.message || "Transaksi gagal.";
                        const detail = res.data?.errors?.jumlah
                            ? res.data.errors.jumlah[0]
                            : "";

                        Swal.fire({
                            icon: "error",
                            title: "Transaksi Gagal",
                            text: detail ? `${msg} (${detail})` : msg,
                        });
                    } else {
                        console.error("Error saving transaction:", error);

                        Swal.fire({
                            icon: "error",
                            title: "Error",
                            text: "Terjadi kesalahan pada server.",
                        });
                    }
                });
        },
        goBack() {
            // Kembali ke dashboard
            this.$router.push({ name: "dashboard" });
        },
    },
    mounted() {
        if (!this.loggedIn) {
            this.$router.push({ name: "login" }); // Redirect ke halaman login jika tidak login
        }
    },
};
</script>

<style scoped>
/*  */
</style>
