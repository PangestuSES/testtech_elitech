import { createRouter, createWebHistory } from 'vue-router'
import HomeIndex from '../views/home/Index.vue'
import LoginIndex from '../views/auth/Index.vue'
import DashboardIndex from '../views/dashboard/Index.vue'
import TransaksiPage from '../views/dashboard/Transaksi.vue';
import TambahForm from '../views/dashboard/Tambah.vue';

const routes = [
  { path: '/', name: 'home', component: HomeIndex },
  { path: '/login', name: 'login', component: LoginIndex },
  { path: '/dashboard', name: 'dashboard', component: DashboardIndex },
  { path: '/transaksi', name: 'transaksi', component: TransaksiPage },
  { path: '/tambah', name: 'tambah', component: TambahForm }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
