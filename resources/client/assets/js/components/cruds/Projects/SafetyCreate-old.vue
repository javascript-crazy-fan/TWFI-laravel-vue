<template>
  <section class="content-wrapper" style="min-height: 960px;">
    <section class="content-header">
      <h1>
        Safety/
        <span>Create</span>
      </h1>
    </section>

    <section class="content">
      <div class="row">
        <div class="w-100">
          <form @submit.prevent="submitForm" autocomplete="off">
            <div class="box">
              <div class="box-body">
                <back-buttton></back-buttton>
              </div>

              <bootstrap-alert />

              <div class="box-body row">
                
                  <div class="form-group col-md-6">
                    <input
                      type="text"
                      class="form-control"
                      name="pic"
                      placeholder="PIC"
                      :value="item.pic"
                      @input="updatePic"
                      required
                    />
                  </div>
                  <div class="form-group col-md-6">
                    <div class="row">
                      <div class="col-md-12">
                        <input
                          type="text"
                          class="form-control"
                          name="phone"
                          placeholder="Phone"
                          :value="item.phone"
                          @input="updatePhone"
                          required
                        />
                      </div>
                      
                    </div>
                  </div>
                  <div class="form-group col-md-6">
                    <input
                      type="text"
                      class="form-control"
                      name="sse"
                      placeholder="SSE"
                      @input="updateSse"
                      value=""
                    />
                  </div>
                  <div class="form-group col-md-6">
                    <input
                      type="text"
                      class="form-control"
                      name="mentor"
                      placeholder="Mentor"
                      @input="updateMentor"
                      value=""
                    />
                  </div>

                  <div class="col-md-12">
                    <h3 class="main-heading">Job Steps</h3>
                  </div>
                  

                  <div class="parent-div" v-for="(section, index) in sections">
                    <div class="col-md-10">
                      <h4 class="sub-heading">Job steps #{{index+1}}</h4>
                    </div>
                    <div class="main-div"> 
                      <div class="job-step"> 
                        <div class="col-md-6">
                        <input
                            type="text"
                            class="form-control"
                            name="jobstep[]"
                            placeholder="Job Step"
                            @input="updateJobStep"
                            value=""
                          />
                        </div>
                        <div class="col-md-6">
                        <input
                            type="text"
                            class="form-control"
                            name="person_responsible[]"
                            placeholder="Person Responsible"
                            value=""
                          />
                        </div>

                      </div>
                      <a @click="deleteSection(index)"><i class="fa fa-trash"></i></a>
                    </div> 

                    <div class="haz-con">
                      <h5>Hazards and Controls
                      </h5>
                      <div class="row" v-for="(addition, counter) in section.additionals" style="margin-top:10px;">
                        <div class="col-md-5">
                          <input
                              type="text"
                              class="form-control"
                              name="hazard[]"
                              :placeholder="'Hazard #'+ counter+1"
                              value=""
                              v-model="addition.hazard"
                            />
                        </div>
                        <div class="col-md-5">
                          <input
                              type="text"
                              class="form-control"
                              name="control[]"
                              :placeholder="'Control #'+ counter+1"
                              value=""
                              v-model="addition.control"
                            />
                        </div>
                        <div class="col-md-2"><a @click="deleteAddition(index, counter)"><i class="fa fa-trash"></i></a></div> 
                      </div>

                      <div class="row" style="margin-top:10px;">
                        <div class="col-md-5">
                          <input
                              type="text"
                              class="form-control"
                              name="hazard[]"
                              placeholder="Hazard # 1"
                              value=""
                              v-model="section.hazard"
                            />
                        </div>
                        <div class="col-md-5">
                          <input
                              type="text"
                              class="form-control"
                              name="control[]"
                              placeholder="Control # 1"
                              value=""
                              v-model="section.control"
                            />
                        </div>
                        <div class="col-md-2"><a @click="deleteAddition(index, counter)"><i class="fa fa-trash"></i></a></div> 
                      </div> 
                     
                    </div>
                    <a class="btn btn-success mt-2 mb-2" @click="addNewItem(index)" style="margin-left:15px">
                      New Item
                    </a>

                  </div>

                  
                  <div class="col-md-12">
                    <a class="btn btn-success mt-2 mb-2" @click="addNewSection">
                      New Deal Section
                    </a>
                  </div>

                  <div class="col-md-12">
                    <h3 class="main-heading">Requirements / Pre-Conditions</h3>
                    <input
                      type="text"
                      class="form-control"
                      name="requirements"
                      value=""
                    />
                  </div>

                  <div class="col-md-12">
                    <h3 class="main-heading">Area / Equipment</h3>
                    <input
                      type="text"
                      class="form-control"
                      name="area"
                      value=""
                    />
                  </div>

                  <div class="col-md-12">
                    <h3 class="main-heading">Attachments</h3>
                    <input
                      type="text"
                      class="form-control"
                      name="attachments"
                      value=""
                    />
                  </div>  

                  <div class="col-md-12" v-for="(sign, index) in signs">
                    <h3 class="main-heading">Signatures</h3>
                    <VueSignaturePad width="500px" height="500px" ref="signaturePad" />
                    <a class="btn btn-success" @click="save(index)">Save</a>
                    <a class="btn btn-cancel" @click="undo(index)">Undo</a>
                    <input type="hidden" :id="'sign-pic-'+index" name="sign_pic[]">

                    <div class="new-sign" v-for="(add, counter) in sign.adds">
                      <VueSignaturePad width="500px" height="500px" ref="signaturePad" />
                    
                      <a class="btn btn-success" @click="save(index)">Save</a>
                      <a class="btn btn-cancel" @click="undo(index)">Undo</a>
                      <input type="hidden" :id="'sign-pic-'+index" name="sign_pic[]">
                    </div>

                    
                  </div>

                  <div class="col-md-12">
                    <a class="btn btn-success mt-2 mb-2" @click="addNewSign">
                      New Sign
                    </a>
                  </div>
                  
                  <div class="box-body col-md-6">                  
                    <button type="submit" class="btn btn-primary btn-sm ml-auto" :isLoading="loading" :disabled="loading" @click="handleShowMap"
                    >
                    <span v-if="isCreate">Create Project</span>
                    <span v-else>Save</span>
                    </button>
                  </div>

                
                
              </div>

              

            </div>
          </form>
        </div>
      </div>



    </section>
  </section>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'

export default {
  data() {
    return {
      statusOptions: ['Active', 'On Deck'],
      options: {
        format: 'YYYY-MM-DD',
        useCurrent: false,
      },
      sections: [
        {
            hazard: '',
            control: '',
            additionals: []
        }
      ],
      signs: [
        {
          adds: []
        }
      ] 
    }
  },
  computed: {
    ...mapGetters('ProjectsSafetySingle', ['item', 'loading']),
    isCreate: function() {
      return !(this.$route.params && this.$route.params.id)
    },
  },
  


  methods: {
    ...mapActions('ProjectsSafetySingle', [
      'storeData',
      'updateData',
      'resetState',
      'setPic',
      'setPhone',
      'setSse',
      'setMentor',
      'setJobStep',
      
    ]),
    updatePic(e) {
      this.setPic(e.target.value)
    },
    updatePhone(e) {
      this.setPhone(e.target.value)
    },
    updateSse(e) {
      this.setSse(e.target.value)
    },
    updateMentor(e) {
      this.setMentor(e.target.value)
    },
    updateJobStep(e) {
      this.setJobStep(e.target.value)
    },
    submitForm() {
        
        this.storeData()
          .then(() => {
            this.$router.push({ name: 'projects.safety' })
            this.$eventHub.$emit('create-success')
          })
          .catch((error) => {
            console.error(error)
          })
    },
    handleShowMap(e) {},
    isNumber: function(evt) {
      evt = (evt) ? evt : window.event;
      var charCode = (evt.which) ? evt.which : evt.keyCode;
      if ((charCode > 31 && (charCode < 48 || charCode > 57)) && charCode !== 46) {
        evt.preventDefault();;
      } else {
        return true;
      }
    },
    
    addNewSection() {
      this.sections.push({
          hazard: '',
          control: '',
          additionals: []
      })
    },
    addNewItem(id) {
      this.sections[id].additionals.push({
          hazard: '',
          control: ''
      })
    },
    deleteSection(id)
    {
      this.sections.splice(id, 1);
    },
    deleteAddition(sid, aid)
    {
      this.sections[sid].additionals.splice(aid,1);
    },
    addNewSign() {
      this.signs.push({
          adds: []
      })
    },
    undo(id) {
      this.$refs.signaturePad[id].undoSignature();
    },
    save(id) {
      console.log(id);
      const { isEmpty, data } = this.$refs.signaturePad[id].saveSignature();
      var element = document.getElementById("sign-pic-"+id);
      element.value = data;
    }
  
  },
}
</script>

<style scoped>
.parent-div {
    width: 100%;
}

.job-step {
    width: 90%;
    display: flex;
    align-items: center;
    float: left;
}

.main-div a {
    width: 10%;
    float: left;
    text-align: center;
}
.haz-con {
    width: 100%;
    padding: 40px 15px 10px;
}
</style>
