<template>
  <section class="content-wrapper" style="min-height: 960px;">
    <section class="content-header">
      <h1>Projects/Safety</h1>
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
                <router-link
                  :to="{ name: xprops.route + '.create'  , params: { id:  this.$route.params.id  } }"
                  class="btn btn-success btn-sm"
                >
                  <i class="fa fa-plus"></i> Add new
                </router-link>
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
              <datatable
                  v-if="!loading"
                  :columns="columns"
                  :data="data"
                  :total="total"
                  :query="query"
                  :xprops="xprops"
                  :selection="selectedUsers"
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
      selectedUsers: [],
    }
  },
  created() {
    this.$root.relationships = this.relationships
    this.fetchData(this.$route.params.id)
    this.fetchAuth()
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
    ...mapActions('ProjectsSafety', ['fetchData', 'setQuery', 'resetState']),
    ...mapActions('Auth', ['fetchAuth']),
    refreshData()
    {
      this.fetchData(this.$route.params.id)
    },
  },
}
</script>

<style scoped></style>
