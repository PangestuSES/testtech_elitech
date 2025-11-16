<template>
  <div class="dashboard" style="margin-top:80px;">
    <div class="container">
      <div class="row g-3">
        <!-- Menu Samping -->
        <div class="col-md-12">
        <h5 class="mb-3">DASHBOARD</h5>
          <div class="card">
            <div class="card-body d-flex justify-content-between align-items-center">
                <div>
                    Selamat Datang <strong>{{ user.name }}</strong>
                </div>
                <button
                    @click="logout"
                    class="btn btn-outline-danger btn-sm"
                    style="cursor:pointer"
                >
                    LOGOUT
                </button>
            </div>
          </div>
        </div>

        <!-- Daftar Barang dan Laporan Stok -->
        <div class="col-md-12">
          <div class="card">
            <div class="card-body">
              <h4>Laporan Stok Barang</h4>
              <hr>

              <!-- Filter Tanggal -->
              <div class="form-group">
                <label for="tanggal">Pilih Tanggal Filter</label>
                <input type="date" id="tanggal" class="form-control" v-model="tanggal" @change="fetchLaporan" />
              </div>

                <div class="d-flex align-items-center gap-2 mt-3 mb-3">
                    <!-- Tombol Transaksi -->
                    <router-link to="/transaksi" class="btn btn-success">
                    Tambah Transaksi
                    </router-link>
                    
                    <!-- Tombol Tambah Barang -->
                    <router-link to="/tambah" class="btn btn-primary">
                    Tambah Barang
                    </router-link>
                </div>

              <!-- Tabel Daftar Barang -->
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th>Kode Barang</th>
                    <th>Nama Barang</th>
                    <th>Satuan</th>
                    <th>Stok Awal</th>
                    <th>Stok Akhir</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="item in barang" :key="item.id">
                    <td>{{ item.kode_barang }}</td>
                    <td>{{ item.nama_barang }}</td>
                    <td>{{ item.satuan }}</td>
                    <td>{{ item.stok_awal }}</td>
                    <td>{{ item.stok_akhir }}</td>
                  </tr>
                </tbody>
              </table>

              <!-- Pagination -->
              <nav v-if="totalPages > 1" aria-label="Page navigation">
                <ul class="pagination">

                  <!-- Prev Button -->
                  <li class="page-item" :class="{ disabled: currentPage === 1 }">
                    <button class="page-link" @click="changePage(currentPage - 1)" :disabled="currentPage === 1">
                      Prev
                    </button>
                  </li>

                  <!-- Page Numbers -->
                  <li v-for="page in totalPages" :key="page" class="page-item"
                    :class="{ active: currentPage === page }">
                    <button class="page-link" @click="changePage(page)">
                      {{ page }}
                    </button>
                  </li>

                  <!-- Next Button -->
                  <li class="page-item" :class="{ disabled: currentPage === totalPages }">
                    <button class="page-link" @click="changePage(currentPage + 1)"
                      :disabled="currentPage === totalPages">
                      Next
                    </button>
                  </li>
                </ul>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'Dashboard',

  data() {
    return {
      loggedIn: localStorage.getItem('loggedIn'),
      token: localStorage.getItem('token'),
      user: [],  // Untuk menyimpan data user
      barang: [],  // Untuk menyimpan data barang
      tanggal: '',  // Untuk menyimpan tanggal filter
      currentPage: 1,
      perPage: 5,
      totalPages: 1,
    };
  },

  created() {
    // Ambil data pengguna
    axios.get('http://localhost:8000/api/user', { headers: { 'Authorization': 'Bearer ' + this.token } })
      .then(response => {
        this.user = response.data; // Menyimpan data user
      })
      .catch(error => {
        console.error('Error fetching user data:', error);
      });

    // Ambil data barang pertama kali (tanpa filter tanggal)
    this.fetchLaporan();
  },

  methods: {
    fetchLaporan() {
      const params = {
        tanggal: this.tanggal || '',  // Send the filter date, if provided
        page: this.currentPage,  // Send the current page
        per_page: this.perPage,  // Send the number of items per page
      };

      axios.get('http://localhost:8000/api/laporan', {
        headers: { 'Authorization': 'Bearer ' + this.token },
        params: params,
      })
        .then(response => {
          // Update table data
          this.barang = response.data.data;

          // Update pagination from backend
          this.currentPage = response.data.current_page;
          this.perPage = response.data.per_page;
          this.totalPages = response.data.last_page;
        })
        .catch(error => {
          console.error('Error fetching barang data:', error);
        });
    },

    changePage(page) {
      if (page < 1 || page > this.totalPages) return;
      this.currentPage = page;
      this.fetchLaporan()
    },

    logout() {
      axios.get('http://localhost:8000/api/logout', { headers: { 'Authorization': 'Bearer ' + this.token } })
        .then(() => {
          localStorage.removeItem("loggedIn"); // Menghapus data login
          localStorage.removeItem("token");    // Menghapus token
          this.$router.push({ name: 'login' }); // Mengarahkan ke halaman login
        })
        .catch(error => {
          console.error('Error logging out:', error);
        });
    }
  },

  mounted() {
    if (!this.loggedIn) {
      this.$router.push({ name: 'login' }); // Redirect ke halaman login jika tidak login
    }
  }
}
</script>

<style scoped>
/* Styling tambahan jika diperlukan */
</style>
