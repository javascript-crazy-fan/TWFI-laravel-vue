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
          <form id="form" @submit.prevent="submitForm" autocomplete="off">
            <input type="hidden" name="project_id" :value="this.$route.params.id">
            <div class="box">
              <div class="box-body">
                <div class="col-md-12">
                  <back-buttton></back-buttton>
                </div>
              </div>

              <bootstrap-alert />

              <div class="box-body row">
                
                  <div class="form-group col-md-6">
                    <input
                      type="text"
                      class="form-control"
                      name="pic"
                      placeholder="PIC"
                      required
                      :value="item.pic"
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
                          required
                          :value="item.phone"
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
                      :value="item.sse"
                    />
                  </div>
                  <div class="form-group col-md-6">
                    <input
                      type="text"
                      class="form-control"
                      name="mentor"
                      placeholder="Mentor"
                      :value="item.mentor"
                    />
                  </div>

                  <div class="col-md-12">
                    <h3 class="main-heading">Job Steps</h3>
                  </div>

                  <div v-if = "item.jobs!=null" v-for="jobs in item.jobs.jobs">
                    {{jobs.jobstep}}
                      
                  </div>

                  <div class="parent-div" v-if = "item.jobs!=null" v-for="(section, index) in item.jobs.jobs">
                    <div class="col-md-10">
                      <h4 class="sub-heading">Job steps #{{index+1}}</h4>
                    </div>
                    <div class="main-div"> 
                      <div class="job-step"> 
                        <div class="col-md-6">
                        <input
                            type="text"
                            class="form-control"
                            :name="'jobstep['+index+']'"
                            placeholder="Job Step"
                            :value="section.jobstep"
                          />
                        </div>
                        <div class="col-md-6">
                        <input
                            type="text"
                            class="form-control"
                            :name="'person_responsible['+index+']'"
                            placeholder="Person Responsible"
                            :value="section.person_responsible"
                          />
                        </div>

                      </div>
                      <a @click="deleteSection(index)" class="delete-btn"><i class="fa fa-trash"></i></a>
                    </div> 

                    <div class="haz-con">
                      <h5 style="clear:both;">Hazards and Controls</h5>
                      <div class="row" v-for="(addition, counter) in section.additionals" style="margin-top:10px;">
                        <div class="col-md-5">
                          <input
                              type="text"
                              class="form-control"
                              :name="'hazard['+index+'][]'"
                              :placeholder="'Hazard #'+ counter+1"
                              value=""
                            />
                        </div>
                        <div class="col-md-5">
                          <input
                              type="text"
                              class="form-control"
                              :name="'control['+index+'][]'"
                              :placeholder="'Control #'+ counter+1"
                              value=""
                            />
                        </div>
                        <div class="col-md-2"><a @click="deleteAddition(index, counter)" class="delete-btn"><i class="fa fa-trash"></i></a></div> 
                      </div>

                      <div class="row" v-for="(extra, cc) in section.hazard" style="margin-top:10px;">
                        <div class="col-md-5">
                          <input
                              type="text"
                              class="form-control"
                              :name="'hazard['+index+'][]'"
                              placeholder="Hazard # 1"
                              :value="section.hazard[index]"
                            />
                        </div>
                        <div class="col-md-5">
                          <input
                              type="text"
                              class="form-control"
                              :name="'control['+index+'][]'"
                              placeholder="Control # 1"
                              :value="section.control[index]"
                            />
                        </div>
                        <div class="col-md-2"><a @click="deleteAddition(index, counter)" class="delete-btn"><i class="fa fa-trash"></i></a></div> 
                      </div> 
                     
                    </div>
                    <a class="btn btn-dark mt-2 mb-2" @click="addNewItem(index)" style="margin-left:15px">
                      New Item
                    </a>

                  </div>

                  
                  <div class="col-md-12">
                    <a class="btn btn-secondary mt-2 mb-2" @click="addNewSection">
                      New Section
                    </a>
                  </div>

                  <div class="col-md-12">
                    <h3 class="main-heading">Requirements / Pre-Conditions</h3>
                    <input
                      type="text"
                      class="form-control"
                      name="requirements"
                      :value="item.requirements"
                    />
                  </div>

                  <div class="col-md-12">
                    <h3 class="main-heading">Area / Equipment</h3>
                    <input
                      type="text"
                      class="form-control"
                      name="area"
                      :value="item.area"
                    />
                  </div>

                  <div class="col-md-12">
                    <h3 class="main-heading">Attachments</h3>
                    <input
                      type="text"
                      class="form-control"
                      name="attachments"
                      :value="item.attachments"
                    />
                  </div>  
                  <div class="col-md-12">
                    <h3 class="main-heading">Signatures</h3>
                  </div>
                  <div class="col-md-12 signature-col" v-for="(sign, index) in signs">
                    
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-5">
                          <label>Signature 1</label>
                          <VueSignaturePad width="500px" height="250px" style="border: 2px solid #aaa; margin-bottom: 15px;" ref="signaturePad" />
                          <input type="text" class="form-control" placeholder="Type Name" :name="'sign_name_'+index" value="" style="margin-bottom:10px;">
                          <div class="btn-group-cstm">
                            
                            <a class="btn btn-secondary" @click="save(index)">Save</a>
                            <a class="btn btn-default ml-2" @click="undo(index)">Undo</a>
                            <input type="hidden" :id="'sign-pic-'+index" name="sign_pic[]">
                          </div>
                      </div>
                      <div class="col-md-1">
                        <a @click="deleteSignature(index)" class="delete-btn"><i class="fa fa-trash"></i></a>
                      </div>
                      <div class="col-md-3"></div>

                    </div>
                    

                    <div class="new-sign" v-for="(add, counter) in sign.adds">
                      <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-5">
                          <VueSignaturePad width="500px" height="250px" style="border: 2px solid; margin-bottom: 15px;" ref="signaturePad" />
                          <input type="text" class="form-control" placeholder="Type Name" :name="'sign_name_'+index" value="" style="margin-bottom:10px;">
                          <div class="btn-group">
                            <a class="btn btn-success" @click="save(index)">Save</a>
                            <a class="btn btn-default" @click="undo(index)">Undo</a>
                            <input type="hidden" :id="'sign-pic-'+index" name="sign_pic[]">
                          </div>
                        </div>
                        <div class="col-md-1">
                          <a @click="deleteSignature(index)" class="delete-btn"><i class="fa fa-trash"></i></a>
                        </div>
                        <div class="col-md-3"></div>
                      </div>
                    </div>
                    
                  </div>

                  <div class="col-md-12">
                    <a class="btn btn-dark mt-2 mb-2" @click="addNewSign">
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
  created() {
    if (this.$route.params.id) {
      // edit
      this.fetchData(this.$route.params.id)
    } else {
      // create
    }
  },
  destroyed() {
    this.resetState()
  },
  watch: {
    '$route.params.id': function() {
      this.resetState()
      this.fetchData(this.$route.params.id)
    },
  },

  methods: {
    ...mapActions('ProjectsSafetySingle', [
      'storeData',
      'updateData',
      'resetState',
      'setProject',
      'setProjectNumber',
      'setStatus',
      'setStartDate',
      'setEndDate',
      'setCountry',
      'setAddress',
      'setCity',
      'setRegion',
      'setPostalCode',
      'setLongitude',
      'setLatitude',
      'fetchData',
    ]),
    submitForm() {
        var form = document.getElementById('form');
        var formData = new FormData(form);
        
        axios
        .post('/api/v1/projects/storeSafety', formData)
        .then((response) => {
          if(response.data.status === true)
          {
            window.location = "/admin/projects/"+response.data.projectId+"/reports/safety"
          }
        })
        .catch((error) => {
          let message = error.response.data.message || error.message
          let errors = error.response.data.errors

          dispatch(
            'Alert/setAlert',
            { message: message, errors: errors, color: 'danger' },
            { root: true },
          )

          reject(error)
        })
        .finally(() => {
          //commit('setLoading', false)
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
    },
    deleteSignature(id)
    {
      this.signs.splice(id, 1);
    }
  },
};
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
h3.main-heading {
    font-size: 17px;
    font-weight: 600;
    color: #777;
}
.form-group.col-md-6 {
    padding: 0 15px;
}
.box-body.row {
    margin: 0;
}
.main-div {
    clear: both;
    float: left;
    width: 100%;
}
a.delete-btn {
    font-size: 21px;
    color: red;
    display: flex;
    align-items: center;
    cursor: pointer;
    justify-content: center;
}

a.delete-btn:hover {
    opacity: 0.7;
}
.parent-div .col-md-10 {
    padding-top: 0;
    padding-bottom: 0;
}

h4.sub-heading {
    margin: 0;
    font-size: 20px;
    font-weight: 600;
    color: #333;
}

.haz-con {
    clear: both;
    padding-top: 15px !important;
}

.haz-con h5 {
    font-size: 16px;
    font-weight: 600;
    color: #555;
}
.main-div {
    display: flex;
    align-items: center;
}
.parent-div {
    background: #f1f1f1;
    margin-bottom: 15px;
    padding-top: 15px;
    padding-bottom: 15px;
}
.haz-con {
    background: #dfdbdb;
    width: 98% !important;
    margin: 0 1%;
    padding-bottom: 16px !important;

}
.signature-col label {
    text-align: center;
    display: block;
    font-size: 16px;
    font-weight: 600;
    color: #999;
    max-width: 500px;
}

.signature-col a.delete-btn {
    margin-top: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100%;
}
button.btn.btn-primary.btn-sm.ml-auto {
    font-size: 18px;
    color: #fff;
    background: green;
    padding: 6px 30px;
    text-transform: uppercase;
    font-weight: 600;
}
</style>
