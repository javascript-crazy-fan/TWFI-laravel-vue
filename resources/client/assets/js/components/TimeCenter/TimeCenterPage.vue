<template>
  <section class="content-wrapper" style="min-height: 960px;">
    <div class="dashboard-page">
      <div class="search-box">
        <datepicker
          input-class="form-control"
          name="search_date"
          :value="searchDate"
        />
        <!-- <v-select
          name="status"
          label="status"
          :value="searchOrder"
          :options="searchOrderAll"
        />
        <v-select
          name="status"
          label="status"
          @input="updateStatus"
          :value="searchStatus"
          :options="searchStatusAll"
        /> -->
      </div>
      <div class="cards-container">
        <div
          class="card-wrapper"
          v-for="project in projectsAll"
          v-bind:key="project.id"
        >
          <TimeCenterCard :project="project" />
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import TimeCenterCard from './TimeCenterCard.vue'

export default {
  data() {
    return {
      searchDate: new Date(),
      searchOrder: '',
      searchStatus: '',
      searchOrderAll: [],
      searchStatusAll: ['Active', 'Pending', 'Complete'],
    }
  },
  computed: {
    ...mapGetters('Alert', ['message', 'errors', 'color']),
    ...mapGetters('ProjectsIndex', { projectsAll: 'allAssigns' }),
  },
  created() {
    this.fetchProjectsAll()
  },
  destroyed() {
    this.resetState()
  },
  watch: {
    '$route.params.id': function() {
      this.resetState()
    },
  },
  methods: {
    ...mapActions('Alert', ['resetState']),
    ...mapActions('ProjectsIndex', { fetchProjectsAll: 'fetchDataWithAssign' }),
  },
  components: {
    TimeCenterCard: TimeCenterCard,
  },
}
</script>

<style lang="scss" scoped>
.cards-container {
  padding: 20px;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
}

.search-box {
  display: flex;
  align-items: center;
  justify-content: flex-end;
}
.form-control{
  height: 50px;
  font-size: 30px;
}
</style>
