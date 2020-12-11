<template>
  <div id="app">
    <!-- <p>{{ message }}</p> -->
    <Contact></Contact>
  </div>
</template>

<script>
import Contact from './components/contact'
export default {
  components: {
    Contact
  },
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
