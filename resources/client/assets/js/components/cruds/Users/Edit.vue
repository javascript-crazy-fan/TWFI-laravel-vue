<template>
  <section class="content-wrapper" style="min-height: 960px;">
    <section class="content-header">
      <h1>
        Users/
        <span v-if="isCreate">Create</span>
        <span v-else>Edit</span>
      </h1>
    </section>

    <section class="content">
      <div class="row">
        <div class="w-100">
          <form @submit.prevent="submitForm" autocomplete="off">
            <div class="box">
              <div class="p-2 d-flex justify-content-between w-100">
                <back-buttton></back-buttton>
                <vue-button-spinner
                  class="btn btn-primary btn-sm"
                  :isLoading="loading"
                  :disabled="loading"
                >
                  <span v-if="isCreate">Create</span>
                  <span v-else>Save</span>
                </vue-button-spinner>
              </div>

              <bootstrap-alert />

              <div class="p-2">
                <b-card no-body>
                  <b-tabs pills card>
                    <b-tab title="General" active>
                      <b-card-text>
                        <div class="d-flex" style="gap: 30px;">
                          <div style="width: 200px;">
                            <div class="avatar-wrapper">
                              <img
                                :src="
                                  item.avatar
                                    ? '/storage/' + item.avatar
                                    : '/adminlte/img/default-user-avatar.png'
                                "
                                alt="avatar"
                                class="avatar"
                                @error="handleAvatarError"
                              />
                            </div>
                            <input
                              type="file"
                              id="avatar_selector"
                              @change="updateAvatar"
                            />
                          </div>
                          <div class="w-100">
                            <div class="row">
                              <div class="form-group col-md-6">
                                <label>First Name</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  name="first_name"
                                  placeholder="First Name"
                                  :value="item.first_name"
                                  @input="updateInput"
                                  required
                                />
                              </div>
                              <div class="form-group col-md-6">
                                <label>Last Name</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  name="last_name"
                                  placeholder="Last Name"
                                  :value="item.last_name"
                                  @input="updateInput"
                                  required
                                />
                              </div>
                            </div>
                            <div class="row">
                              <div class="form-group col-md-6">
                                <label>Email</label>
                                <input
                                  type="email"
                                  class="form-control"
                                  name="email"
                                  placeholder="Email"
                                  :value="item.email"
                                  @input="updateInput"
                                  required
                                />
                              </div>
                              <div class="form-group col-md-6">
                                <label>Employee Number</label>
                                <input
                                  type="number"
                                  class="form-control"
                                  name="employee_number"
                                  placeholder="Employee #"
                                  :value="item.employee_number"
                                  @input="updateInput"
                                />
                              </div>
                            </div>
                            <div class="row">
                              <!-- <div class="form-group col-md-6">
                                <label>Rate</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  name="rate"
                                  placeholder="Rate"
                                  :value="item.rate"
                                  @input="updateInput"
                                  @keypress="isNumber($event)"
                                />
                              </div> -->
                              <!-- <div class="form-group col-md-6">
                                <label>Classification</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  name="classification"
                                  placeholder="Classification"
                                  :value="item.classification"
                                  @input="updateInput"
                                />
                              </div> -->
                              <div class="form-group col-md-6">
                                <label>Phone Number</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  name="phone_number"
                                  placeholder="Phone Number"
                                  :value="item.phone_number"
                                  @input="updateInput"
                                />
                              </div>
                              <div class="form-group col-md-6">
                                <label>Role</label>
                                <v-select
                                  name="role_id"
                                  label="title"
                                  @input="updateRole"
                                  :value="
                                    rolesAll.find(
                                      (role) => role.id === item.role_id,
                                    )
                                  "
                                  :options="rolesAll"
                                />
                              </div>
                            </div>
                            <div class="row">
                              <!-- <div class="form-group col-md-6">
                                <label>Trade</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  name="trade"
                                  placeholder="Trade"
                                  :value="item.trade"
                                  @input="updateInput"
                                />
                              </div> -->
                              <!-- <div class="form-group col-md-6">
                                <label>Phone Number</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  name="phone_number"
                                  placeholder="Phone Number"
                                  :value="item.phone_number"
                                  @input="updateInput"
                                />
                              </div> -->
                            </div>
                            <div class="row">
                              <!-- <div class="form-group col-md-6">
                                <label>Pay Class</label>
                                <v-select
                                  name="pay_class"
                                  @input="updatePayClass"
                                  :value="item.pay_class"
                                  :options="payclassAll"
                                />
                              </div> -->
                              <!-- <div class="form-group col-md-6">
                                <label>Role</label>
                                <v-select
                                  name="role_id"
                                  label="title"
                                  @input="updateRole"
                                  :value="
                                    rolesAll.find(
                                      (role) => role.id === item.role_id,
                                    )
                                  "
                                  :options="rolesAll"
                                />
                              </div> -->
                            </div>
                            <div class="row">
                              <!-- <div class="form-group col-md-6">
                                <label>Tags</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  name="tags"
                                  placeholder="Tags"
                                  :value="item.tags"
                                  @input="updateInput"
                                />
                              </div> -->
                              <div class="form-group col-md-6">
                                <label for="company">Company</label>
                                <v-select
                                  name="company"
                                  label="name"
                                  @input="updateCompany"
                                  :value="item.company"
                                  :options="companiesAll"
                                />
                              </div>
                              <div class="form-group col-md-6">
                                <label>Medical Notes</label>
                                <textarea
                                  type="text"
                                  class="form-control"
                                  name="medical_notes"
                                  placeholder="Medical Notes"
                                  :value="item.medical_notes"
                                  @input="updateInput"
                                />
                              </div>
                            </div>
                            <div class="row">
                              <!-- <div class="form-group col-md-6">
                                <label>Medical Notes</label>
                                <textarea
                                  type="text"
                                  class="form-control"
                                  name="medical_notes"
                                  placeholder="Medical Notes"
                                  :value="item.medical_notes"
                                  @input="updateInput"
                                />
                              </div> -->
                            </div>
                            <div class="row">
                              <div class="form-group col-md-6">
                                <label>Emergency Contact Name</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  name="emergency_contact_name"
                                  placeholder="Emergency Contact Name"
                                  :value="item.emergency_contact_name"
                                  @input="updateInput"
                                />
                              </div>
                              <div class="form-group col-md-6">
                                <label>Emergency Contact Phone</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  name="emergency_contact_phone"
                                  placeholder="Emergency Contact Phone"
                                  :value="item.emergency_contact_phone"
                                  @input="updateInput"
                                />
                              </div>
                            </div>
                            <div class="row">
                              <!-- <div class="form-group col-md-6">
                                <div class="custom-control custom-checkbox">
                                  <input
                                    type="checkbox"
                                    class="custom-control-input"
                                    id="is_collaborator"
                                    name="is_collaborator"
                                    :checked="!!item.is_collaborator"
                                    @change="updateCheckbox"
                                  />
                                  <label
                                    class="custom-control-label"
                                    for="is_collaborator"
                                    >Is collaborator?</label
                                  >
                                </div>
                              </div> -->
                              <div class="form-group col-md-6">
                                <div class="custom-control custom-checkbox">
                                  <input
                                    type="checkbox"
                                    class="custom-control-input"
                                    id="send_invitation_email"
                                    name="send_invitation_email"
                                    :checked="!!item.send_invitation_email"
                                    @change="updateCheckbox"
                                  />
                                  <label
                                    v-if="isCreate"
                                    class="custom-control-label"
                                    for="send_invitation_email"
                                    >Send invitation email</label
                                  >
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </b-card-text>
                      <input type="hidden" id="certificate_data" name="certificate_data" value="[]">
                    </b-tab>
                    <b-tab title="Titles">
                      <b-card-text>
                        <div class="d-flex flex-wrap">
                          <div
                            class="toggle-wrapper w-100"
                            v-for="title in titlesAll"
                            v-bind:key="title.id"
                          >
                            <toggle-button
                              :sync="true"
                              :value="
                                item.titles.findIndex(
                                  (userTitle) =>
                                    userTitle.is_include == 1 &&
                                    userTitle.title_id == title.id,
                                ) > -1
                              "
                              :color="{
                                checked: '#0088cc',
                                unchecked: '#aaa',
                                disabled: '#CCCCCC',
                              }"
                              :labels="{
                                checked: title.title,
                                unchecked: title.title,
                              }"
                              :font-size="16"
                              :width="50"
                              :height="25"
                              @change="(value) => updateTitles(title.id, value)"
                            />
                          </div>
                        </div>
                      </b-card-text>
                    </b-tab>
                    <!-- <b-tab title="Permissions">
                      <b-card-text>
                        <div class="d-flex flex-wrap">
                          <div
                            class="toggle-wrapper w-100"
                            v-for="permission in permissionsAll"
                            v-bind:key="permission.id"
                          >
                            <toggle-button
                              :sync="true"
                              :value="
                                item.permissions.findIndex(
                                  (userPermission) =>
                                    userPermission.permission == 1 &&
                                    userPermission.permission_id ==
                                      permission.id,
                                ) > -1
                              "
                              :color="{
                                checked: '#00cc88',
                                unchecked: '#aaa',
                                disabled: '#CCCCCC',
                              }"
                              :labels="{
                                checked: permission.title,
                                unchecked: permission.title,
                              }"
                              :font-size="16"
                              :width="50"
                              :height="25"
                              @change="
                                (value) =>
                                  updatePermissions(permission.id, value)
                              "
                            />
                          </div>
                        </div>
                      </b-card-text>
                    </b-tab> -->
                    <b-tab title="Certificates">
                      <b-card-text>
                        <div style="width:50%;">
                          <div>
                            <input 
                              type="text" 
                              name="certificate_name" 
                              id="certificate_name" 
                              class="w-100" 
                              style="height: 40px; margin-bottom:20px;" 
                              placeholder="FileName"
                              :value="item.certificate_name"
                              @input="updateInput"
                            >
                            <br>
                          </div>
                          <div>
                            <textarea 
                              name="certificate_description" 
                              id="certificate_description" 
                              class="w-100" 
                              style="height: 100px; margin-bottom:20px;" 
                              placeholder="Description"
                              :value="item.certificate_description"
                              @input="updateInput"
                            >
                            </textarea>
                            <br>
                          </div>
                          <div>
                            <input type="file" style="height: 40px; margin-bottom:20px;">
                            <br>
                          </div>                          
                          <span class="input-group-btn">
                            <button
                              id = "uploadCertBtn" 
                              class="btn btn-default" 
                              type="button"
                              @click="uploadCertData"
                            >
                            Upload PDF
                            </button>
                          </span>
                        </div> 

                        <!-- <datatable
                          v-if="!loading"
                          :columns="columns"
                          :data="data"
                          :total="total"
                          :query="query"
                          :xprops="xprops"
                          />                      -->
                      </b-card-text>
                    </b-tab>
                  </b-tabs>
                </b-card>
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
import DatatableActions from '../../dtmodules/DatatableActions'

export default {
  data() {
    return {
      dropzoneOptions: {
        url: 'https://httpbin.org/post',
        addRemoveLinks: true,
        dictRemoveFile: 'Remove',
        maxFiles: 1,
      },
      processQueue: false,
      showRemoveAllButton: false,

      // columns: [
      //   { title: 'FileName', field: 'certificate_name', sortable: false },
      //   { title: 'Description', field: 'certificate_description', sortable: false },
      //   { title: 'Upload Date', field: 'created_at', sortable: false },
      //   {
      //     title: 'Actions',
      //     tdComp: DatatableActions,
      //     visible: true,
      //     thClass: 'text-right',
      //     tdClass: 'text-right',
      //     colStyle: 'width: 130px;',
      //     tdStyle: 'vertical-align: middle',
      //   },
      // ],
      // query: { sort: 'id', order: 'desc' },
      // xprops: {
      //     module: 'CompaniesIndex',
      //     route: 'companies'
      // }
    }
  },
  computed: {
    ...mapGetters('UsersIndex', ['data', 'total', 'loading']),
    ...mapGetters('UsersSingle', [
      'item',
      'loading',
      'rolesAll',
      'titlesAll',
      'permissionsAll',
      'companiesAll',
      // 'certificate_name',
      // 'certificate_description',
    ]),
    isCreate: function() {
      return !(this.$route.params && this.$route.params.id)
    },
  },
  created() {
    this.fetchCompaniesAll()
    this.fetchRolesAll()
    this.fetchTitlesAll()
    this.fetchPermissionsAll()
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
    ...mapActions('UsersSingle', [
      'fetchData',
      'fetchRolesAll',
      'fetchTitlesAll',
      'fetchPermissionsAll',
      'fetchCompaniesAll',
      'storeData',
      'updateData',
      // 'storeCertificate',
      // 'updateCertificate',
      'resetState',
      'setInput',
      'setTitles',
      'setPermissions',
    ]),
    updateInput(e) {
      this.setInput({
        name: e.target.name,
        value: e.target.value,
      })
    },
    updateCheckbox(e) {
      this.setInput({
        name: e.target.name,
        value: e.target.checked ? 1 : 0,
      })
    },
    updateRole(v) {
      this.setInput({
        name: 'role_id',
        value: v.id,
      })
    },
    updatePayClass(v) {
      this.setInput({
        name: 'pay_class',
        value: v,
      })
    },
    updateCompany(v) {
      this.setInput({
        name: 'company',
        value: v,
      })
    },
    updateTitles(title_id, value) {
      this.setTitles({ title_id, value: value.value })
    },
    updatePermissions(permission_id, value) {
      this.setPermissions({ permission_id, value: value.value })
    },
    submitForm() {
      if (this.$route.params.id) {
        // edit
        this.updateData()
          .then(() => {
            this.$router.push({ name: 'users.index' })
            this.$eventHub.$emit('update-success')
          })
          .catch((error) => {
            console.error(error)
          })
      } else {
        this.storeData()
          .then(() => {
            this.$router.push({ name: 'users.index' })
            this.$eventHub.$emit('create-success')
          })
          .catch((error) => {
            console.error(error)
          })
      }
    },

    //ceriticates
    uploadCertData(){ 
        // Getting value into JSON format from hidden tag       
        var cert_data = $("#certificate_data").val()
        cert_data = JSON.parse(cert_data)

        // Getting value from certificate form
        var certificate_name = $("#certificate_name").val()
        var certificate_description = $("#certificate_description").val()        
        
        // Appending new JSON data into existing value
        var cert_item = {}
        cert_item["certificate_name"] = certificate_name
        cert_item["certificate_description"] = certificate_description
        cert_item["user_id"] = this.$route.params.id

        // if (this.$route.params.id){
        //   item["user_id"] = this.$route.params.id
        // }
        // else{
        //   item["user_id"] = "None"
        // }

        cert_data.push(cert_item)

        // console.log(cert_data)
        $("#certificate_data").val(JSON.stringify(cert_data))
        var ret_data = $("#certificate_data").val()
        ret_data = JSON.parse(ret_data)

        // Empty input form value
        $("#certificate_name").val('')
        $("#certificate_description").val('')

        console.log(ret_data)
      
    },

    setImage: function(file) {
      this.hasImage = true
      this.image = file
    },
    handleAvatarError(e) {
      e.target.src = '/adminlte/img/default-user-avatar.png'
    },
    isNumber: function(evt) {
      evt = (evt) ? evt : window.event;
      var charCode = (evt.which) ? evt.which : evt.keyCode;
      if ((charCode > 31 && (charCode < 48 || charCode > 57)) && charCode !== 46) {
        evt.preventDefault();;
      } else {
        return true;
      }
    },
    updateAvatar(e) {
      var formData = new FormData()
      formData.append(
        'file',
        document.querySelector('#avatar_selector').files[0],
      )

      var xhr = new XMLHttpRequest();
      xhr.open('POST', '/api/v1/file-upload', true);
      xhr.setRequestHeader('x-csrf-token', document.head.querySelector('meta[name="csrf-token"]').content);

      let setInput = this.setInput;
      xhr.onload = function() {
        if (this.status == 200) {
          var resp = JSON.parse(this.response);

          console.log('Server got:', resp);

          var image = document.querySelector('.avatar');
          image.src = '/storage/' + resp.uploadPath;
          setInput({
            name: 'avatar',
            value: resp.uploadPath,
          })
        };
      };

      xhr.send(formData);
    }
  }
}
</script>

<style scoped>
.avatar-wrapper {
  margin: 0 0 20px 0;
  width: 200px;
  height: 200px;
  padding: 10px;
  background: grey;
}
.avatar {
  width: 100%;
  height: 100%;
  border-radius: 50%;
}
</style>
