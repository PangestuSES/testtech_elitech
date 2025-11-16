<template>
  <div class="dashboard" style="margin-top:80px;">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-8">
          <div class="card">
            <div class="card-body">
              <h4 class="mb-3">Tambah Barang</h4>

              <!-- Form Tambah Barang -->
              <form @submit.prevent="submitForm">

                <!-- Kode Barang -->
                <div class="mb-3">
                  <label for="kode_barang" class="form-label">Kode Barang</label>
                  <input
                    type="text"
                    id="kode_barang"
                    class="form-control"
                    v-model="form.kode_barang"
                    placeholder="BRG-001"
                  />
                  <div v-if="errors.kode_barang" class="text-danger mt-1">
                    <small v-for="(msg, i) in errors.kode_barang" :key="i">
                      {{ msg }}
                    </small>
                  </div>
                </div>

                <!-- Nama Barang -->
                <div class="mb-3">
                  <label for="nama_barang" class="form-label">Nama Barang</label>
                  <input
                    type="text"
                    id="nama_barang"
                    class="form-control"
                    v-model="form.nama_barang"
                    placeholder="UPS, Kabel, dll"
                  />
                  <div v-if="errors.nama_barang" class="text-danger mt-1">
                    <small v-for="(msg, i) in errors.nama_barang" :key="i">
                      {{ msg }}
                    </small>
                  </div>
                </div>

                <!-- Satuan -->
                <div class="mb-3">
                  <label for="satuan" class="form-label">Satuan</label>
                  <input
                    type="text"
                    id="satuan"
                    class="form-control"
                    v-model="form.satuan"
                    placeholder="unit, pcs, box, dll"
                  />
                  <div v-if="errors.satuan" class="text-danger mt-1">
                    <small v-for="(msg, i) in errors.satuan" :key="i">
                      {{ msg }}
                    </small>
                  </div>
                </div>

                <!-- Stok Awal -->
                <div class="mb-3">
                  <label for="stok_awal" class="form-label">Stok Awal</label>
                  <input
                    type="number"
                    id="stok_awal"
                    class="form-control"
                    v-model.number="form.stok_awal"
                    min="0"
                  />
                  <div v-if="errors.stok_awal" class="text-danger mt-1">
                    <small v-for="(msg, i) in errors.stok_awal" :key="i">
                      {{ msg }}
                    </small>
                  </div>
                </div>

                <!-- Tombol Aksi -->
                <div class="d-flex mt-4">

                    <button
                        type="button"
                        class="btn btn-primary "
                        @click="goBack"
                    >
                        Kembali
                    </button>
                 
                    <button
                        type="submit"
                        class="btn btn-success ms-4"
                    >
                        Simpan
                    </button>
                </div>

              </form>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "TambahBarang",

  data() {
    return {
      loggedIn: localStorage.getItem('loggedIn'),
      token: localStorage.getItem('token'),
      form: {
        kode_barang: "",
        nama_barang: "",
        satuan: "",
        stok_awal: 0,
      },
      errors: {},
    };
  },

  methods: {
    async submitForm() {
      this.errors = {};

      try {
        await axios.post(
          "http://localhost:8000/api/items",
          this.form,
          {
            headers: {
              Authorization: "Bearer " + this.token,
            },
          }
        );

        // Setelah berhasil simpan, balik ke dashboard / list barang
        this.$router.push({ name: "dashboard" });
      } catch (error) {
        if (error.response && error.response.status === 422) {
          // Validasi dari Laravel (FormRequest / validator)
          this.errors = error.response.data.errors || {};
        } else {
          console.error("Error menyimpan barang:", error);
          alert("Terjadi kesalahan saat menyimpan data.");
        }
      }
    },

    goBack() {
      this.$router.back();
    },
  },
  mounted() {
    if (!this.loggedIn) {
      this.$router.push({ name: 'login' }); // Redirect ke halaman login jika tidak login
    }
  }
};
</script>
