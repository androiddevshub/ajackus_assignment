<template>
   <div class="container-contact100">
		<div class="wrap-contact100">
			<div class="contact100-form validate-form">
				<span class="contact100-form-title">
					Send Us A Message
				</span>

				<label class="label-input100" for="first-name">Tell us your name *</label>
				<div class="wrap-input100 rs1-wrap-input100 validate-input"  data-validate="Type first name">
					<input ref="first-name" v-model="firstName" class="input100" @click="hideValidate('first-name')" type="text" placeholder="First name">
					<span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 rs2-wrap-input100 validate-input" data-validate="Type last name">
					<input ref="last-name" class="input100" v-model="lastName" @click="hideValidate('last-name')" type="text" placeholder="Last name">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="email">Enter your email *</label>
				<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
					<input ref="email" class="input100" v-model="email" @click="hideValidate('email')" type="text" placeholder="Eg. example@email.com">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="phone">Enter phone number</label>
				<div class="wrap-input100">
					<input ref="phone"  class="input100" v-model="phone" type="text" @click="hideValidate('phone')" placeholder="Eg. +1 800 000000">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="message">Message *</label>
				<div class="wrap-input100 validate-input" data-validate = "Message is required">
					<textarea ref="message" class="input100" @click="hideValidate('message')" v-model="message" placeholder="Write us a message"></textarea>
					<span class="focus-input100"></span>
				</div>

				<div class="container-contact100-form-btn">
					<button @click="submitForm()" class="contact100-form-btn">
						Send Message
					</button>
				</div>
			</div>

			<div class="contact100-more flex-col-c-m" style="backgroundImage: url('./bg-01.jpg');">
				<div class="flex-w size1 p-b-47">
					<div class="txt1 p-r-25">
						<span>
              <b-icon icon="map"></b-icon>
            </span>
					</div>

					<div class="flex-col size2">
						<span class="txt1 p-b-20">
							Address
						</span>

						<span class="txt2">
							Mada Center 8th floor, 379 Hudson St, New York, NY 10018 US
						</span>
					</div>
				</div>

				<div class="dis-flex size1 p-b-47">
					<div class="txt1 p-r-25">
						<span>
              <b-icon icon="telephone"></b-icon>
            </span>
					</div>

					<div class="flex-col size2">
						<span class="txt1 p-b-20">
							Lets Talk
						</span>

						<span class="txt3">
							+1 800 1236879
						</span>
					</div>
				</div>

				<div class="dis-flex size1 p-b-47">
					<div class="txt1 p-r-25">
						<span>
              <b-icon icon="envelope"></b-icon>
            </span>
					</div>

					<div class="flex-col size2">
						<span class="txt1 p-b-20">
							General Support
						</span>

						<span class="txt3">
							contact@example.com
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
import axios from 'axios'
export default {
  name: "contact",
  data(){
    return{
      validForm: null,
      firstName: null,
      lastName: null,
      email: null,
      phone: null,
      message: null,
      baseUrl: 'http://localhost:3000',
      phoneRegex: /^\d+$/,
      emailRegex: /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,24}))$/
    }
  },
  created(){

  },
  methods: {
    submitForm(){

     

      

      this.validForm = true
      console.log(this.firstName, 'firstname')
      if(this.firstName === null || this.firstName === ""){
        this.validForm = false
        this.showValidate("first-name");
      }if(this.lastName === null || this.lastName === ""){
        this.validForm = false
        this.showValidate("last-name");
      }
      if(this.email === null || this.email === "" || !(this.emailRegex.test(this.email))){
        this.validForm = false
        this.showValidate("email")
      }
      if(this.message === null || this.message === ""){
        this.validForm = false
        this.showValidate("message")
      }
      console.log(this.validForm, "valid form")
      if(this.validForm){
        return axios
        .post(`${this.baseUrl}/api/contacts`,{
          first_name: this.firstName,
          last_name: this.lastName,
          email: this.email,
          phone: this.phone,
          message: this.message
        })
        .then(response => {
          if (response.data.status){
            this.firstName = null
            this.lastName = null
            this.email = null
            this.phone = null
            this.message = null
            this.$notify({
              title: 'Success',
              message: 'We have received you message, kindly wait for the response',
              type: 'success',
              offset: 100
            });
          }
        })
        .catch(e => {
          this.$notify.error({
            title: 'Error',
            message: 'Something went wrong',
            offset: 100
          });
          
        });
      }
      
      
    },
    validate(input){
      if(input.trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
        return false;
      }
    },
    showValidate(field) {
      const input = this.$refs[field]
      const thisAlert = input.parentElement
      thisAlert.classList.add('alert-validate')
    },
    hideValidate(field) {
      const input = this.$refs[field]
      const thisAlert = input.parentElement
      thisAlert.classList.remove('alert-validate')
    }
  },
}
</script>

<style src="./contact.css" scoped></style>