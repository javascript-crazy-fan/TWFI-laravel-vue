function initialState() {
  return {
    all: [],
    allAssigns: [],
    relationships: {
      company: 'name',
    },
    query: {},
    loading: false,
    usersAll: [],
  }
}

function queryFilter(obj) {
  var str = [];
  for (var p in obj)
    if (obj.hasOwnProperty(p)) {
      str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
    }
  return str.join("&");
}

const getters = {
  all: (state) => state.all,
  allAssigns: (state) => state.allAssigns,
  data: (state) => {
    let rows = state.all

    if (state.query.sort) {
      rows = _.orderBy(state.all, state.query.sort, state.query.order)
    }

    return rows.slice(
      state.query.offset,
      state.query.offset + state.query.limit,
    )
  },
  total: (state) => state.all.length,
  loading: (state) => state.loading,
  relationships: (state) => state.relationships,
  usersAll: (state) => state.usersAll,
}

const actions = {
  fetchData({ commit, state }, id) {
    commit('setLoading', true)
    axios
      .get('/api/v1/projects/safety/' + id)
      .then((response) => {
        
        commit('setAll', response.data)
      })
      .catch((error) => {
        message = error.response.data.message || error.message
        commit('setError', message)
        console.log(message)
      })
      .finally(() => {
        commit('setLoading', false)
      })
  },
  fetchusersAll({ commit }) {
    axios.get('/api/v1/projects/getUsers').then((response) => {
      commit('setusersAll', response.data)
    })
  },
  filterData({ commit, state }, filter_data) {
    var id = filter_data.safety_id;
    filter_data = queryFilter(filter_data);
    commit('setLoading', true);
    axios
      .get('/api/v1/projects/safety/' + id + '?' +filter_data)
      .then((response) => {
        
        commit('setAll', response.data)
      })
      .catch((error) => {
        message = error.response.data.message || error.message
        commit('setError', message)
        console.log(message)
      })
      .finally(() => {
        commit('setLoading', false)
      })
  },
  destroyData({ commit, state }, id) {
    axios
      .get('/api/v1/projects/safety_delete/' + id)
      .then((response) => {
        commit(
          'setAll',
          state.all.filter((item) => {
            return item.id != id
          }),
        )
      })
      .catch((error) => {
        message = error.response.data.message || error.message
        commit('setError', message)
        console.log(message)
      })
  },
  pdfData({ commit, state }, id) {
    window.open('/admin/safety/pdf/'+id, '_blank');
  },
  setQuery({ commit }, value) {
    commit('setQuery', purify(value))
  },
  resetState({ commit }) {
    commit('resetState')
  },
  fetchDataWithAssign({ commit, state }) {
    commit('setLoading', true)

    axios
      .get('/api/v1/projects/all-assign')
      .then((response) => {
        commit('setAllAssigns', response.data)
      })
      .catch((error) => {
        message = error.response.data.message || error.message
        commit('setError', message)
        console.log(message)
      })
      .finally(() => {
        commit('setLoading', false)
      })
  },
}

const mutations = {
  setAll(state, items) {
    state.all = items
  },
  setAllAssigns(state, items) {
    state.allAssigns = items
  },
  setLoading(state, loading) {
    state.loading = loading
  },
  setQuery(state, query) {
    state.query = query
  },
  resetState(state) {
    state = Object.assign(state, initialState())
  },
  setusersAll(state, value) {
    state.usersAll = value
  },
}

export default {
  namespaced: true,
  state: initialState,
  getters,
  actions,
  mutations,
}
