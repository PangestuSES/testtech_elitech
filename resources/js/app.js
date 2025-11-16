import { createApp } from 'vue'          
import App from './App.vue'
import router from './router/index';

import './bootstrap';
import 'bootstrap/dist/css/bootstrap.css';
import 'jquery/dist/jquery.min';
import 'popper.js/dist/popper.min';
import 'bootstrap/dist/js/bootstrap.min';

import axios from 'axios'

axios.defaults.withCredentials = true

const app = createApp(App)
app.config.productionTip = false
app.use(router)
app.mount('#app')             

