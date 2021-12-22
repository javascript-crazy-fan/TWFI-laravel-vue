<template>
  <div class="project-cell">
    <router-link
      :to="{ name: 'dashboard.show', params: { id: project.id } }"
      class="icon"
    >
      <div class="project-cell-body-section">
        <div class="general">
          <div class="header">
            <h4>{{ project.project }}</h4>
            <h5># {{ project.project_number }}</h5>
          </div>
          <div class="info">
            <div class="address">
              <div class="text">
                {{ project.address }}
                {{ project.city }}
                {{ project.country }}
                {{ project.region }}
              </div>
            </div>
            <div class="est_compl">
              <div>
                <span>Start Date</span> &gt;
                <strong>{{ project.start_date }}</strong>
              </div>
              <div>
                <span>Estimated Completion</span> &gt;
                <strong>{{ project.end_date }}</strong>
              </div>
            </div>
          </div>
        </div>
        <!-- <div class="team" v-if="!!project.users.length"> -->
        <div class="team">
          <img
            :src="creatorImage0"
            width="70"
            height="70"
            :title="project.users[0] && project.users[0].first_name"
            class="super"
          />
          <img
            :src="creatorImage1"
            width="70"
            height="70"
            :title="project.users[1] && project.users[1].first_name"
            class="fireman"
          />
          <div class="counter">+{{ project.users.length }}</div>
        </div>
      </div>
      <hr class="clearfix" />
    </router-link>
    <div class="icons">
      <a class="icon" :href="`/admin/projects/${project.id}/reports/daily`">
        <i class="fa fa-file-o fa-2x" aria-hidden="true"></i>
        <!--
        <div class="badge-container">
          <span class="badge badge-danger" aria-hidden="true">0</span>
        </div>
        -->
      </a>
      <!-- <router-link to="project.timecard.index" class="icon">
        <i class="fa fa-clock-o fa-2x" aria-hidden="true"></i>

        <div class="badge-container">
          <span class="badge badge-danger" aria-hidden="true">0</span>
        </div>

      </router-link> -->
	  <!-- <a class="icon" :href="`/admin/projects/${project.id}/reports/time`">
	  	<i class="fa fa-clock-o fa-2x" aria-hidden="true"></i>
	  </a> -->
	  <router-link
		:to="{ name: 'projects.time', params: { id: project.id, users: project.users } }"
		class="icon"
      >
	  	<i class="fa fa-clock-o fa-2x" aria-hidden="true"></i>
	  </router-link>
      <!-- <router-link to="project.photo.index" class="icon">
        <i class="fa fa-file-image-o fa-2x" aria-hidden="true"></i>

        <div class="badge-container">
          <span class="badge badge-danger" aria-hidden="true">0</span>
        </div>

      </router-link> -->
      <a class="icon" :href="`/admin/projects/${project.id}/reports/safety`">
        <i class="fa fa-file-pdf-o fa-2x" aria-hidden="true"></i>
        <!--
        <div class="badge-container">
          <span class="badge badge-danger" aria-hidden="true">0</span>
        </div>
        -->
      </a>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
  name: "DashboardCard",
  props: ["project"],
  data() {
    return {
      // Code...
      defaultImage: "/adminlte/img/default-user-avatar.png",
    };
  },
  computed: {
    ...mapGetters("Alert", ["message", "errors", "color"]),
    creatorImage0() {
      return this.project.users[0] && this.project.users[0].avatar
        ? this.project.users[0] && "/storage/" + this.project.users[0].avatar
        : this.defaultImage;
    },
    creatorImage1() {
      return this.project.users[1] && this.project.users[1].avatar
        ? this.project.users[1] && "/storage/" + this.project.users[1].avatar
        : this.defaultImage;
    },
  },
  created() {
    // Code...
  },
  destroyed() {
    this.resetState();
  },
  methods: {
    ...mapActions("Alert", ["resetState"]),
    handleAvatarError(e) {
      e.target.src = "/adminlte/img/default-user-avatar.png";
    },
  },
};
</script>

<style scoped>
*,
*::after,
*::before {
  box-sizing: border-box;
}

.project-cell {
  background: white;
  border-radius: 12px;
  border: 1px solid #aaa;
  padding: 15px;
}

.project-cell-body {
  color: black;
}

.project-cell-body-section {
  display: flex;
  justify-content: space-between;
}

.general {
  width: 60%;
}

.general .header h4 {
  color: black;
  font-size: 18px;
  font-weight: 600;
  line-height: 19.8px;
  margin: 0 0 10px 0;
  padding: 0;
}

.general .header h5 {
  color: black;
  font-size: 14px;
  font-weight: 400;
  line-height: 15.4px;
  margin: 0;
  padding: 0;
}

.info {
  margin: 10px 0 0 0;
}

.info .address {
  font-size: 14px;
  line-height: 20px;
  color: black;
}

.info .est_compl {
  margin: 10px 0 0 0;
  color: rgb(153, 153, 153);
  font-size: 12px;
  line-height: 17px;
}

.team {
  position: relative;
}

.team img {
  border-radius: 50%;
  position: absolute;
}

.team .super {
  top: 39px;
  right: 55px;
  z-index: 1;
}

.team .fireman {
  top: 10px;
  right: 10px;
  z-index: 2;
}

.team .counter {
  width: 36px;
  height: 36px;
  margin: 10p;
  line-height: 36px;
  text-align: center;
  z-index: 3;
  -webkit-box-shadow: 0px 0px 4px #000f;
  box-shadow: 1px 1px 10px #0006;
  border-radius: 50%;
  position: absolute;
  right: 31px;
  top: 69px;
  background: white;
}

.icons {
  display: flex;
  justify-content: flex-end;
  gap: 20px;
}

.icons a {
  color: #333;
}

.icons a:hover {
  text-decoration: none;
}

.icon i {
  color: #999;
}

.icon {
  position: relative;
}

.icon .badge-container {
  position: absolute;
  top: -10px;
  right: -5px;
}
</style>
