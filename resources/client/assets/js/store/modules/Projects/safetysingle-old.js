function initialState() {
  return {
    item: {
      id: null,
      pic: null,
      phone: null,
      sse: null,
      mentor: null,
      jobstep: [],
      person_responsible: [],
      hazard: [],
      control: [],
      requirements: null,
      area: null,
      attachments: null,
      sign_pic: []

    },
    loading: false,
  }
}

const getters = {
  item: (state) => state.item,
  loading: (state) => state.loading
}

const actions = {
  storeData({ commit, state, dispatch }) {
    commit('setLoading', true)
    dispatch('Alert/resetState', null, { root: true })
    
    return new Promise((resolve, reject) => {
      let params = _.cloneDeep(state.item)
      params.start_date = moment(params.start_date).format('YYYY-MM-DD')
      params.end_date = moment(params.end_date).format('YYYY-MM-DD')
      console.log('params:', params)
      
      axios
        .post('/api/v1/projects/storeSafety', params)
        .then((response) => {
          commit('resetState')
          resolve()
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
          commit('setLoading', false)
        })
    })
  },

  updateData({ commit, state, dispatch }) {
    commit('setLoading', true)
    dispatch('Alert/resetState', null, { root: true })

    return new Promise((resolve, reject) => {
      let params = _.cloneDeep(state.item)
      params.start_date = moment(params.start_date).format('YYYY-MM-DD')
      params.end_date = moment(params.end_date).format('YYYY-MM-DD')

      axios
        .put('/api/v1/projects/' + params.id, params)
        .then((response) => {
          commit('setItem', response.data.project)
          resolve()
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
          commit('setLoading', false)
        })
    })
  },

  fetchData({ commit, dispatch }, id) {
    axios.get('/api/v1/projects/' + id).then((response) => {
      response.data.start_date = moment(response.data.start_date).toDate()
      response.data.end_date = moment(response.data.end_date).toDate()
      commit('setItem', response.data)
    })
  },


  setPic({ commit }, value) {
    commit('setPic', value)
  },

  setPhone({ commit }, value) {
    commit('setPhone', value)
  },

  setSse({ commit }, value) {
    commit('setSse', value)
  },

  setMentor({ commit }, value) {
    commit('setMentor', value)
  },

  setJobStep({ commit }, value) {
    commit('setJobStep', value)
  },

  setEndDate({ commit }, value) {
    commit('setEndDate', value)
  },

  setCountry({ commit }, value) {
    commit('setCountry', value)
  },

  setAddress({ commit }, value) {
    commit('setAddress', value)
  },

  setCity({ commit }, value) {
    commit('setCity', value)
  },

  setRegion({ commit }, value) {
    commit('setRegion', value)
  },

  setPostalCode({ commit }, value) {
    commit('setPostalCode', value)
  },

  setLongitude({ commit }, value) {
    commit('setLongitude', value)
  },

  setLatitude({ commit }, value) {
    commit('setLatitude', value)
  },

  resetState({ commit }) {
    commit('resetState')
  },
}

const mutations = {
  setItem(state, item) {
    state.item = item
  },
  setPic(state, value) {
    state.item.pic = value
  },
  setPhone(state, value) {
    state.item.phone = value
  },
  setSse(state, value) {
    state.item.sse = value
  },
  setMentor(state, value) {
    state.item.mentor = value
  },
  setJobStep(state, param) {
    //state.item = param
    /*let jobstepdata = state.item.jobstep;
    jobstepdata.push({
      job_steps : {
          step_name: param
      }
    });
    // jobstepdata['job_steps']['step_name'] =  param;
    state.item.jobstep = jobstepdata;
    console.log(state.item.jobstep);*/
    state.item.jobstep = param
  },
  setEndDate(state, value) {
    state.item.end_date = value
  },
  setCountry(state, value) {
    state.item.country = value
  },
  setAddress(state, value) {
    state.item.address = value
  },
  setCity(state, value) {
    state.item.city = value
  },
  setRegion(state, value) {
    state.item.region = value
  },
  setPostalCode(state, value) {
    state.item.postal_code = value
  },
  setLongitude(state, value) {
    state.item.longitude = value
  },
  setLatitude(state, value) {
    state.item.latitude = value
  },
  setLoading(state, loading) {
    state.loading = loading
  },
  resetState(state) {
    state = Object.assign(state, initialState())
  },
  
}

export default {
  namespaced: true,
  state: initialState,
  getters,
  actions,
  mutations,
}
