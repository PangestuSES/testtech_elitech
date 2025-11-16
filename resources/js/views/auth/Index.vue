<template>
    <div class="login">
        <div class="container" style="margin-top:100px">
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div v-if="loginFailed" class="alert alert-danger">
                        Email atau Password Anda salah.
                    </div>
                    <div class="card">
                        <div class="card-body">
                            LOGIN
                            <hr>
                            <form @submit.prevent="login">

                                <div class="form-group mb-3">
                                    <label>EMAIL</label>
                                    <input type="email" class="form-control" v-model="user.email"
                                        placeholder="Masukkan Email">
                                    <div v-if="validation.email" class="mt-2 alert alert-danger">
                                        Masukkan Email
                                    </div>
                                </div>

                                <div class="form-group mb-3">
                                    <label>PASSWORD</label>
                                    <input type="password" class="form-control" v-model="user.password"
                                        placeholder="Masukkan Password">
                                </div>

                                <button type="submit" class="btn btn-primary">LOGIN</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios'
import Swal from 'sweetalert2'

export default {
    name: 'Login',

    data() {
        return {
            //state loggedIn with localStorage
            loggedIn: localStorage.getItem('loggedIn'),
            //state token
            token: localStorage.getItem('token'),
            //state user
            user: [],
            //state validation
            validation: [],
            //state login failed
            loginFailed: null
        }
    },
    methods: {
        login() {
            this.validation = {}

            // cek input kosong dulu
            if (!this.user.email || !this.user.password) {

                if (!this.user.email) {
                    this.validation.email = true
                }

                if (!this.user.password) {
                    this.validation.password = true
                }

                Swal.fire({
                    icon: 'warning',
                    title: 'Login gagal',
                    text: 'Email dan password wajib diisi.',
                })

                return
            }

            axios.get('http://localhost:8000/sanctum/csrf-cookie')
                .then(response => {

                    axios.post('http://localhost:8000/api/login', {
                        email: this.user.email,
                        password: this.user.password
                    }).then(res => {
                        console.log(res)
                        if (res.data.success) {
                            localStorage.setItem("loggedIn", "true")
                            localStorage.setItem("token", res.data.token)
                            this.loggedIn = true

                            return this.$router.push({ name: 'dashboard' })
                        } else {
                            // email / password salah
                            Swal.fire({
                                icon: 'error',
                                title: 'Login gagal',
                                text: 'Email atau password tidak sesuai.',
                            })
                        }

                    }).catch(error => {
                        console.log(error)
                        Swal.fire({
                            icon: 'error',
                            title: 'Server error',
                            text: 'Terjadi kesalahan pada server.',
                        })
                    })
                })
        }
    },

    //check user already logged in
    mounted() {
        if (this.loggedIn) {
            return this.$router.push({ name: 'dashboard' })
        }
    }
}
</script>