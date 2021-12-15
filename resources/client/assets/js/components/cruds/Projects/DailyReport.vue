<template>
  <section class="content-wrapper" style="min-height: 960px;">
    <section class="content-header">
      <h1>Projects/DailyReports</h1>
    </section>

    <section class="content">
      <div class="row">
        <div class="w-100">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">List</h3>
            </div>

            <div class="box-body">
              <div class="btn-group">
                <button
                  type="button"
                  class="btn btn-secondary btn-sm"
                  @click="refreshData"
                >
                  <i class="fa fa-refresh" :class="{ 'fa-spin': loading }"></i>
                  Refresh
                </button>
              </div>
            </div>

            <div class="box-body">
              <div class="row" v-if="loading">
                <div class="col-xs-4 col-xs-offset-4">
                  <div class="alert text-center">
                    <i class="fa fa-spin fa-refresh"></i> Loading
                  </div>
                </div>
              </div>
              <div class="filter-section">
                <div class="btn-group filter-label">
                  <a href="#" @click="handleTimecard">Filters</a>
                </div>
                <div class="filter-tag" v-if="start_date && end_date">
                  <a href="#" @click="handleTagClose($event, 'date')">
                    <i class="fa fa-close"></i>
                  </a>
                  <div>
                    <strong>Assigned Date: </strong>
                    <span>{{start_date}} To {{ end_date }}</span>
                  </div>
                </div>
                <div class="filter-tag" v-if="created_by">
                  <a href="#" @click="handleTagClose($event, 'created')">
                    <i class="fa fa-close"></i>
                    {{ created_by.length }}
                  </a>
                  <div>
                    <strong>Created By: </strong>
                    <span>{{ created_by.title}}</span>
                  </div>
                </div>
              </div>
              <Modal
                v-show="isModalVisible"
                @close="closeModal"
                v-bind:showBtn="false"
                modalSize="modal-lg"
              >
              <div slot="header" style="width: 100%">
              Filters
              </div>
              <div slot="body">
                <div class="container">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>Start Date</label>
                        <date-picker v-model="start_date" :config="options" class="form-control" placeholder="Start Date"></date-picker>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <label>End Date</label>
                      <date-picker v-model="end_date" :config="options" class="form-control" placeholder="End Date"></date-picker>
                    </div>
                    <div class="col-md-12">
                      <label>Created By</label>
                      <v-select
                      v-model="created_by"
                      name="created_by"
                      label="title"
                      class="form-control"
                      placeholder="Created By"
                      :options="usersAll"
                    />
                    </div>
                  </div>
                </div>
              </div>
              <div slot="footer" class="w-100">
                <div class="w-100 d-flex">
                  <button
                    class="btn btn-default ml-auto"
                    type="button"
                    @click="closeModal"
                  >
                    Close
                  </button>
                  <button type="submit" class="btn btn-success" @click="handleFilterData">Apply</button>
                </div>
              </div>
              </Modal>
              <datatable
                v-if="!loading"
                :columns="columns"
                :data="data"
                :total="total"
                :query="query"
                :xprops="xprops"
              />
            </div>
          </div>
        </div>
      </div>
    </section>
  </section>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import axios from 'axios'
import DatatableActions from '../../dtmodules/DatatableActions'
import DatatablePDFLink from '../../dtmodules/DatatablePDFLink'
import DatatableSingle from '../../dtmodules/DatatableSingle'
import DatatableList from '../../dtmodules/DatatableList'
import DatatableCheckbox from '../../dtmodules/DatatableCheckbox'

export default {
  data() {
    return {
      columns: [
        // { title: '#', field: 'id', sortable: true, colStyle: 'width: 50px;' },
        { title: 'Created By', field: 'created_by', sortable: true },
        { title: 'PIC', field: 'pic', sortable: true },
        { title: 'Phone', field: 'phone', sortable: true },
        { title: 'SSE', field: 'sse', sortable: true },
        { title: 'Mentor', field: 'full_name', sortable: true },
        { title: 'Start Date', field: 'created_at', sortable: true },
        { title: 'Update Date', field: 'updated_at', sortable: true },
        { title: 'PDF', tdComp: DatatablePDFLink, visible: true },
        {
          title: 'Actions',
          tdComp: DatatableActions,
          visible: true,
          thClass: 'text-right',
          tdClass: 'text-right',
          colStyle: 'width: 130px;',
        },
      ],
      query: { sort: 'id', order: 'asc' },
      xprops: {
        module: 'ProjectsSafety',
        route: 'projects.safety',
      },
      isModalVisible: false,
      start_date: '',
      options: {
        // https://momentjs.com/docs/#/displaying/
        format: 'YYYY-MM-DD',
        useCurrent: false,
        showClear: true,
        showClose: true,
      },
      end_date: '',
      options: {
        // https://momentjs.com/docs/#/displaying/
        format: 'YYYY-MM-DD',
        useCurrent: false,
        showClear: true,
        showClose: true,
      },
      created_by: null,
    }
  },
  created() {
    this.$root.relationships = this.relationships
    this.fetchData(this.$route.params.id)
    this.fetchAuth()
    this.fetchusersAll()
  },
  destroyed() {
    this.resetState()
  },
  computed: {
    ...mapGetters('ProjectsSafety', [
      'data',
      'total',
      'loading',
      'relationships',
      'usersAll',
    ]),
    ...mapGetters('Auth', [
      'auth'
    ]),
    hasCreatePermission: function() {
      // get the user's permision info

      return this.auth && this.auth.role && this.auth.role.title === "Admin"
    },
    hasEditPermission: function() {
      return this.auth && this.auth.role && this.auth.role.title === "Admin"
    }
  },
  watch: {
    query: {
      handler(query) {
        this.setQuery(query)
      },
      deep: true,
    },
  },
  methods: {
    ...mapActions('ProjectsSafety', ['fetchData', 'filterData', 'setQuery', 'resetState', 'fetchusersAll']),
    ...mapActions('Auth', ['fetchAuth']),
    refreshData()
    {
      this.fetchData(this.$route.params.id)
    },
    handleFilterData (e) {
      e.preventDefault();
      const filter_data = {
          safety_id: this.$route.params.id,
      }
     
      if( (this.start_date === '' && !!this.end_date) || (this.end_date === '' && !!this.start_date) ) {
          alert("Start and End Date is required");
          return false;
      } else {
          if(this.start_date != null && this.end_date != null)
          {
              filter_data.start_date = this.start_date;
              filter_data.end_date = this.end_date;
          }
      }

      if( !!this.created_by ) {
          filter_data.created_by = this.created_by.id;
      }
      this.filterData(filter_data)
      this.closeModal()
    },
    handleTimecard: function (e) {
      e.preventDefault();
      this.showModal();
    },
    showModal() {
      this.isModalVisible = true;
    }, 
    closeModal() {      
      this.isModalVisible = false;
    },
    handleTagClose: function (e,type) {

      e.preventDefault();

      const filter_data = {
        safety_id: this.$route.params.id
      };

      
      if((this.start_date != null && this.end_date != null) || !!this.created_by != null) {

        if(this.start_date != null && this.end_date != null)
        {
            filter_data.start_date = this.start_date;
            filter_data.end_date = this.end_date;
        }

        if(!!this.created_by)
        {
          filter_data.created_by = this.created_by.id;
        }
        
      }

      if(type == 'date') {
        this.start_date = '';
        this.end_date = '';
        delete filter_data.start_date;
        delete filter_data.end_date;
      }

      if(type == 'created') {
        this.created_by = null;
        delete filter_data.created_by;
      }

      this.filterData(filter_data)
    },
  },
}
</script>
<style>
.modal-lg section#modalDescription {
    overflow: unset !important;
    height: max-content !important;
}
.modal-lg {
    height: auto !important;
    overflow: unset !important;
}
.filter-section {
    display: flex;
    flex-direction: row;
    align-items: center;
}
.filter-section .filter-tag {
    display: flex;
    align-items: center;
    padding: 10px 12px;
    border-radius: 5px;
    background-color: #ebebeb;
    margin-bottom: 0;
    margin-right: 5px;
}
.filter-section .filter-tag a {
    margin-right: 10px;
    color: #000;
    font-size: 16px;
}
.filter-section .filter-label {
    margin-right: 15px;
}
.filter-section .filter-label a {
    font-size: 16px;
    color: #000;
}
.modal-backdrop footer.modal-footer button.btn-success {
    margin-left: 10px;
}
.dropdown.v-select.form-control.single.searchable .dropdown-toggle {
    border: none;
    padding: 0;
    box-shadow: none;
    outline: none;
}
.dropdown.v-select.form-control.single.searchable {
    height: auto;
}

</style>
<style scoped></style>
