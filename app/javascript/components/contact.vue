<template>
   <div class="container-contact100">
     <select v-model="selectedLanguage" @change="changeLanguage(selectedLanguage)" class="language-select">
         <option disabled value="">Please select one</option>
         <option v-for="item in languageList" :key="item.id" :value="item.id">{{item.name}}</option>
     </select>
    <loading :active.sync="isLoading" 
      :can-cancel="true"
      loader="bars"
      :is-full-page="fullPage">
    </loading> 
		<div class="wrap-contact100">
			<div class="contact100-form validate-form">
				<span class="contact100-form-title">
					{{$lang.form.form_message}}
				</span>

				<label class="label-input100" for="first-name">{{$lang.form.name}} *</label>
				<div class="wrap-input100 rs1-wrap-input100 validate-input"  :data-validate="$lang.form.first_name_error">
					<input ref="first-name" v-model="firstName" class="input100" @click="hideValidate('first-name')" type="text" :placeholder="$lang.form.first_name_placeholder">
					<span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 rs2-wrap-input100 validate-input" :data-validate="$lang.form.last_name_error">
					<input ref="last-name" class="input100" v-model="lastName" @click="hideValidate('last-name')" type="text" :placeholder="$lang.form.last_name_placeholder">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="email">{{$lang.form.email}} *</label>
				<div class="wrap-input100 validate-input" :data-validate="$lang.form.email_error">
					<input ref="email" class="input100" v-model="email" @click="hideValidate('email')" type="text" :placeholder="$lang.form.email_placeholder">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="phone">{{$lang.form.phone}} *</label>
				<div class="wrap-input100" :data-validate="phone_error ? $lang.form.phone_error2 : $lang.form.phone_error1">
					<input ref="phone"  class="input100" v-model="phone" type="text" @click="hideValidate('phone')" :placeholder="$lang.form.phone_placeholder">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="message">{{$lang.form.message}} *</label>
				<div class="wrap-input100 validate-input" :data-validate="$lang.form.message_error">
					<textarea ref="message" class="input100" @click="hideValidate('message')" v-model="message" :placeholder="$lang.form.message_placeholder"></textarea>
					<span class="focus-input100"></span>
				</div>

				<div class="container-contact100-form-btn">
					<button @click="submitForm()" class="contact100-form-btn">
						{{$lang.form.send}}
					</button>
				</div>
			</div>

			<div class="contact100-more flex-col-c-m">
				<div class="flex-w size1 p-b-47">
					<div class="txt1 p-r-25">
						<span>
              <b-icon icon="map"></b-icon>
            </span>
					</div>

					<div class="flex-col size2">
						<span class="txt1 p-b-20">
							{{$lang.form.address_txt}}
						</span>

						<span class="txt2">
							{{$lang.form.address}}
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
							{{$lang.form.lets_talk}}
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
							{{$lang.form.support}}
						</span>

						<span class="txt3">
							contact@ajackus.com
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
import Loading from 'vue-loading-overlay';
  // Import stylesheet
  import 'vue-loading-overlay/dist/vue-loading.css';
import axios from 'axios'
export default {
  name: "contact",
  components: {
      Loading
  },
  data(){
    return{
      languageList: [
        {
          name: "English",
          id: 1
        },
        {
          name: "French",
          id: 2
        },
        {
          name: "Spanish",
          id: 3
        }
      ],
      selectedLanguage: 1,
      isLoading: false,
      fullPage: true,
      validForm: null,
      firstName: null,
      lastName: null,
      email: null,
      phone: null,
      phone_error: false, 
      message: null,
      baseUrl: 'http://localhost:3000',
      phoneRegex: /^\d+$/,
      emailRegex: /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,24}))$/
    }
  },
  created(){
    // this.$lang.setLang('es')
  },
  methods: {
    changeLanguage(language_id){
      // if (language_id === 1){

      // }
      // if (language_id === 1){

      // }
      // if (language_id === 1){

      // }
      switch (language_id) {
        case 1:
          this.$lang.setLang('en')
          break;
        case 2:
          this.$lang.setLang('fr')
          break;
        case 3:
          this.$lang.setLang('es')
      }
    },
    submitForm(){

      this.validForm = true
      this.phone_error = false
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
      if(this.phone === null || this.phone === "" || !(this.phoneRegex.test(this.phone))){
        this.validForm = false
        this.showValidate("phone")
      }
      else if(this.phone.length > 15){
        this.validForm = false
        this.phone_error = true
        this.showValidate("phone")
      }
      if(this.message === null || this.message === ""){
        this.validForm = false
        this.showValidate("message")
      }
      console.log(this.validForm, "valid form")
      if(this.validForm){
        this.isLoading = true;
        return axios
        .post(`${this.baseUrl}/api/contacts`,{
          user: {
            first_name: this.firstName,
            last_name: this.lastName,
            email: this.email,
            phone: this.phone,
            message: this.message,
            test_param: "test param"
          }
        })
        .then(response => {
          if (response.data.status_code){
            this.firstName = null
            this.lastName = null
            this.email = null
            this.phone = null
            this.message = null
            this.isLoading = false;
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