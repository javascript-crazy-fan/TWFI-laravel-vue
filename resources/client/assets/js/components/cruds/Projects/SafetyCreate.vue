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
                      placeholder="PIC*"
                      required
                      value=""
                      @input="updatePic"
                    />
                  </div>
                  <div class="form-group col-md-6">
                    <div class="row">
                      <div class="col-md-12">
                        <input
                          type="text"
                          class="form-control"
                          name="phone"
                          placeholder="Phone Number*"
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
                      placeholder="SSE*"
                      value=""
                      @input="updateSse"
                      required
                    />
                  </div>
                  <div class="form-group col-md-6">
					<v-select
					name="role"
					label="title"
					placeholder="Select User*"
					class="form-control"
					@input="updateMentor"
					:value="item.mentor"
					:options="usersAll"
					required
					></v-select>
                  </div>

                  <div class="col-md-12">
                    <h3 class="main-heading">Job Steps</h3>
                  </div>

                  <div class="parent-div" v-for="(jobstep, index) in jobsteps" v-bind:key="jobstep.index">
                    <div class="col-md-10">
                      <h4 class="sub-heading">Job steps #{{ jinc = index+1}}</h4>
                    </div>
                    <div class="main-div">
                      <div class="job-step">
                        <div class="col-md-6">
                          <input
                            type="text"
                            class="form-control"
                            placeholder="Job Step"
                            @change="updateJobStep"
                            v-model="jobstep.step_title"
                          />
                        </div>
                        <div class="col-md-6">
                          <input
                            type="text"
                            class="form-control"
                            name="person_responsible[]"
                            placeholder="Person Responsible"
                            @change="updatePersonResponsible"
                            v-model="jobstep.person_responsible"
                          />
                        </div>

                      </div>
                      <a @click="deleteSection(index)" class="delete-btn"><i class="fa fa-trash"></i></a>
                    </div>

                    <div class="haz-con">
                      <h5 style="clear:both;">Hazards and Controls</h5>
                      <div class="row" v-for="(additional, counter) in jobstep.additionals" style="margin-top:10px;" v-bind:key="additional.uid">
                        <div class="col-md-5">
                          <input
                              type="text"
                              class="form-control"
                              :placeholder="'Hazard #'+[[ hinc = counter+1 ]]"
                              @input="updateHazard"
                              :data-index="index"
                              :data-counter="counter"
                            />
                        </div>
                        <div class="col-md-5">
                          <input
                              type="text"
                              class="form-control"
                              :placeholder="'Control #'+ [[ cinc = counter+1 ]]"
                              @input="updateControl"
                              :data-index="index"
                              :data-counter="counter"
                            />
                        </div>
                        <div class="col-md-2"><a @click="deleteAddition({'jbid': index, 'adid':additional.uid})" class="delete-btn"><i class="fa fa-trash"></i></a></div> 
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
                      value=""
                      @input="updateRequirements"
                    />
                  </div>

                  <div class="col-md-12">
                    <h3 class="main-heading">Area / Equipment</h3>
                    <input
                      type="text"
                      class="form-control"
                      name="area"
                      value=""
                      @input="updateArea"
                    />
                  </div>

                  <div class="col-md-12">
                    <h3 class="main-heading">Attachments</h3>
                    <input
                      type="text"
                      class="form-control"
                      name="attachments"
                      value=""
                      @input="updateAttachments"
                    />
                  </div>
                  <div class="col-md-12">
                    <h3 class="main-heading">Signatures</h3>
                  </div>
                  <div class="col-md-12 signature-col" v-for="(sign, index) in signs" v-bind:key="sign.uid">
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-5">
                          <label>Signature {{ sinc = index+1 }}</label>
                          <VueSignaturePad width="500px" height="250px" style="border: 2px solid #aaa; margin-bottom: 15px;" ref="signaturePad" />
                          <input type="text" class="form-control" placeholder="Type Name" v-model="sign.type_name" value="" style="margin-bottom:10px;">
                          <div class="btn-group-cstm">
                            <a class="btn btn-secondary" @click="save(index)">Save</a>
                            <a class="btn btn-default ml-2" @click="undo(index)">Undo</a>
                            <input type="hidden" :id="'sign-pic-'+index" name="sign_pic[]" v-model="sign.signature">
                          </div>
                      </div>
                      <div class="col-md-1">
                        <a @click="deleteSignature(sign.uid)" class="delete-btn"><i class="fa fa-trash"></i></a>
                      </div>
                      <div class="col-md-3"></div>

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
import { mapMutations } from 'vuex'
import { mapMultiRowFields } from 'vuex-map-fields'

export default {
  data(){
   return{
     project_id: this.$route.params.id,
    };
  },

  computed: {
    ...mapGetters('ProjectsSafetyCreate', ['item', 'loading', 'usersAll']),
    ...mapMultiRowFields('ProjectsSafetyCreate',['item.jobsteps','item.signs']),
    isCreate: function() {
      return !(this.$route.params && this.$route.params.id)
    },
  },
  created() {
        this.fetchusersAll()
    },
  updated(){
		$('.v-select input').prop('required', true)
		if ($('.selected-tag').length > 0){
			$('.v-select input').prop('required', false)
		}
  },
  methods: {
    ...mapMutations('ProjectsSafetyCreate',['addNewSection','addNewItem', 'addNewSign', 'deleteSignature', 'deleteSection' , 'deleteAddition']),
    ...mapActions('ProjectsSafetyCreate', [
      'storeData',
      'resetState',
      'setPic',
      'setPhone',
      'setSse',
      'setMentor',
      'setJobStep',
      'setPersonResponsible',
      'setHazard',
      'setControl',
      'setRequirements',
      'setArea',
      'setAttachments',
      'setSignature',
      'setTypename',
      'setProjectID',
      'fetchusersAll'
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
    updateMentor(value) {
      this.setMentor(value)
    },
    updateJobStep(e) {
      this.setJobStep(e.target.value)
    },
    updatePersonResponsible(e) {
      this.setPersonResponsible(e.target.value)
    },
    updateHazard(e) {
      this.setHazard({'data': e.target.value, 'id': e.target.dataset.index, 'hid': e.target.dataset.counter})
    },
    updateControl(e) {
      this.setControl({'data': e.target.value, 'id': e.target.dataset.index, 'hid': e.target.dataset.counter})
    },
    updateRequirements(e) {
      this.setRequirements(e.target.value)
    },
    updateArea(e) {
      this.setArea(e.target.value)
    },
    updateAttachments(e) {
      this.setAttachments(e.target.value)
    },
    submitForm() {
        this.setProjectID(this.$route.params.id);
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
    undo(id) {
      this.$refs.signaturePad[id].undoSignature();
    },
    save(id) {
      const { isEmpty, data } = this.$refs.signaturePad[id].saveSignature();
      var element = document.getElementById("sign-pic-"+id);
      element.value = data;
      this.setSignature({'data': data, 'id': id});
      alert('Signature saved successfully!');
    },
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
    background: #e3e3e3;
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
.form-control {
    border: none;
    border-bottom: 1px solid #ccc;
    background: none;
    padding-left: 0;
    padding-right: 0;
    font-size: 16px;
}
.signature-col div {
    max-width: 100% !important;
}
.dropdown.v-select.form-control.single.searchable .dropdown-toggle{
    padding: 0;
    border: none;
}

@media(max-width:1024px){
  .sign-created * {
    max-width: 100% !important;
}

.signature-col * {
    max-width: 100% !important;
}

.signature-col img {
    width: 100% !important;
}
}
@media(max-width: 767px){
section.content-header {
    margin-top: 30px;
}
.haz-con .col-md-5 {
    width: 44%;
}
.haz-con .col-md-2 {
    width: 12%;
}
.signature-col .col-md-5 {
    width: 87%;
}
.signature-col .col-md-1 {
    width: 13%;
}
.box-body {
    overflow-x: auto;
}
}
</style>
