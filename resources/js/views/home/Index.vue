<template>
  <div class="home" style="margin-top:80px;">
    <div class="jumbotron">
      <div class="container">
        <h1 class="display-3">Selamat Datang</h1>
        <p>
          <router-link
            :to="{ name: 'login' }"
            class="btn btn-primary btn-lg"
            role="button"
          >
            Login
          </router-link>
        </p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
    name: 'Home'
}
</script>