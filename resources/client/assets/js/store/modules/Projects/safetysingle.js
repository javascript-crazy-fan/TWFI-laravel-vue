import { getField, updateField } from 'vuex-map-fields';
import uniqueId from 'lodash/uniqueId'
function initialState() {
	return {
		item: {
			project_id: null,
			pic: null,
			phone: null,
			sse: null,
			mentor: null,
			jobsteps: [
				{
					step_title: '',
					person_responsible: '',
					additionals: [
						{
							uid: uniqueId('ad_'),
							hazard: '',
							control: '',
						}
					]
				}
			],
			signs: [
				{
					uid: uniqueId('si_'),
					signature: '',
					type_name: '',
				}
			],
			requirements: null,
			area: null,
			attachments: null

		},
		loading: false,
		usersAll: [],
	}
}

const getters = {
	getField,
	item: (state) => state.item,
	loading: (state) => state.loading,
	usersAll: (state) => state.usersAll,
}

const actions = {
	storeData({ commit, state, dispatch }) {
		// commit('setLoading', true)
		dispatch('Alert/resetState', null, { root: true })

		return new Promise((resolve, reject) => {
			let params = _.cloneDeep(state.item)
			params.start_date = moment(params.start_date).format('YYYY-MM-DD')
			params.end_date = moment(params.end_date).format('YYYY-MM-DD')
			// console.log('params:', params)
			// console.log('project id: ', this.$route.params.id);
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
					//commit('setLoading', false)
				})
		})
	},

	updateData({ commit, state, dispatch }) {
		// commit('setLoading', true)
		dispatch('Alert/resetState', null, { root: true })

		return new Promise((resolve, reject) => {
			let params = _.cloneDeep(state.item)
			params.start_date = moment(params.start_date).format('YYYY-MM-DD')
			params.end_date = moment(params.end_date).format('YYYY-MM-DD')
			if (!_.isEmpty(params.mentor)) {
				params.mentor = params.mentor.id
			}
			// console.log("ppp", params); return false;
			axios
				.post('/api/v1/projects/editSafety/' + params.id, params)
				.then((response) => {
					window.location.href = '/admin/projects/' + response.data.safety.project_id + '/reports/safety';
					//commit('setItem', response.data.safety)
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
					// commit('setLoading', false)
				})
		})
	},

	fetchData({ commit, dispatch }, id) {
		axios.get('/api/v1/projects/getSafety/' + id).then((response) => {
			response.data.start_date = moment(response.data.start_date).toDate()
			response.data.end_date = moment(response.data.end_date).toDate()
			commit('setItem', response.data)
		})
	},

	fetchusersAll({ commit }) {
		axios.get('/api/v1/projects/getUsers').then((response) => {
			commit('setusersAll', response.data)
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

	setPersonResponsible({ commit }, value) {
		commit('setPersonResponsible', value)
	},

	setHazard({ commit }, value) {
		commit('setHazard', value)
	},

	setControl({ commit }, value) {
		commit('setControl', value)
	},

	setRequirements({ commit }, value) {
		commit('setRequirements', value)
	},

	setArea({ commit }, value) {
		commit('setArea', value)
	},

	setAttachments({ commit }, value) {
		commit('setAttachments', value)
	},

	setSignature({ commit }, value) {
		commit('setSignature', value)
	},

	setTypename({ commit }, value) {
		commit('setTypename', value)
	},

	resetState({ commit }) {
		commit('resetState')
	},

	setProjectID({ commit }, value) {
		commit('setProjectID', value)
	}
}

const mutations = {
	updateField,
	addNewSection(state) {
		state.item.jobsteps.push({
			step_title: '',
			person_responsible: '',
			additionals: [
				{
					uid: uniqueId('ad_'),
					hazard: '',
					control: '',
				}
			],
		})
	},

	addNewItem(state, index) {
		// state.item.jobsteps[index].additionals.splice(1, 0, {"hazard":"","control":""});
		state.item.jobsteps[index].additionals.push({
			uid: uniqueId('ad_'),
			hazard: '',
			control: ''
		})
	},

	addNewSign(state) {

		state.item.signs.push({
			uid: uniqueId('si_'),
			signature: '',
			type_name: '',
		});

	},

	deleteSection(state, id) {
		if (id == 0) {
			state.item.jobsteps.shift();
		}
		else {
			state.item.jobsteps.splice(id, 1);
		}
	},

	deleteAddition(state, id) {
		let arr = state.item.jobsteps[id.jbid];
		arr.additionals = arr.additionals.filter(additional => additional.uid != id.adid);
	},

	deleteSignature(state, id) {
		state.item.signs = state.item.signs.filter(sign => sign.uid != id);
	},


	setItem(state, item) {
		state.item = item
	},
	setusersAll(state, value) {
		state.usersAll = value
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
	setJobStep(state, value) {
		state.item.jobsteps[value.id].step_title = value.data
	},
	setPersonResponsible(state, value) {
		state.item.jobsteps[value.id].person_responsible = value.data
	},
	setHazard(state, value) {
		// item_hazard.push(value);
		state.item.jobsteps[value.id].additionals[value.hid].hazard = value.data
	},
	setControl(state, value) {
		// item_control.push(value);
		state.item.jobsteps[value.id].additionals[value.hid].control = value.data
	},
	setRequirements(state, value) {
		state.item.requirements = value
	},

	setArea(state, value) {
		state.item.area = value
	},

	setAttachments(state, value) {
		state.item.attachments = value
	},
	setSignature(state, value) {
		state.item.signs[value.id].signature = value.data
	},
	setTypename(state, value) {
		state.item.signs[value.id].type_name = value.data
	},

	resetState(state) {
		state = Object.assign(state, initialState())
	},

	setProjectID(state, value) {
		state.item.project_id = value
	}
}

export default {
	namespaced: true,
	state: initialState,
	getters,
	actions,
	mutations,
}
