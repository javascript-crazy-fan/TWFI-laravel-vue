<template>
	<section class="content-wrapper" style="min-height: 960px;">
		<section class="timer">
			<div id="timer">
				<span id="hours">00:</span>
				<span id="mins">00:</span>
				<span id="seconds">00</span>
			</div>
			<div id="controls">
				<button id="start">Start</button>
				<button id="stop">Stop</button>
				<button id="reset">Reset</button>
			</div>
			<div id="submits">
				<button id="submit-btn">
					<a href="#" @click="handleTimecard">Submit
					</a>
				</button>
			</div>
		</section>
		<Modal
			v-show="isEntryModalVisible"
			@close="closeEntryModal"
			v-bind:showBtn="true"
			modalSize="modal-md"
		>
			<div slot="header">Add Entry</div>
			<div slot="body">
				<div class="container-fluid">
					<div class="row">
						<div class="form-group col-md-6">
							<label>Select User</label>
							<select
								v-model="selectedUser"
								name="role"
								label="title"
								placeholder="Select User"
								class="form-control user-select"
							>
								<option
									v-for="users in this.$route.params.users"
									v-bind:key="users.user_id"
									v-bind:value="users.user_id"
								>
									{{users.first_name}} {{users.last_name}}
									<!-- {{users}} -->
								</option>
							</select>
						</div>
					</div>
					<div class="row" v-show="!isAbsent">
						<div class="col-md-8">
							<div class="form-group" v-bind:class="{ active: entryCostCode }">
								<label for="entry_cost_code">Cost Code</label>
								<input
									type="text"
									class="form-control"
									name="entry_cost_code"
									v-model="entryCostCode"
								/>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group" v-bind:class="{ active: entryTimeType }">
							<label for="entry_time_type">Time Type</label>
							<select class="form-control" v-model="entryTimeType">
								<option
								v-for="timeType in timeTypes"
								v-bind:key="timeType.id"
								:value="timeType"
								>
								{{ timeType }}
								</option>
							</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group" v-bind:class="{ active: entryNotes }">
								<label for="entry_notes">Description</label>
								<textarea
									name="entry_notes"
									class="form-control"
									rows="2"
									autoresize
									v-model="entryNotes"
								></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div slot="footer" class="w-100">
				<div class="w-100 btn-actions">
					<div class="float-right">
						<button
							class="btn btn-default mr-1"
							type="button"
							@click="closeEntryModal"
						>Close
						</button>
						<button
							class="btn btn-success"
							type="button"
							@click="submitEntry"
							v-show="!isUpdate"
						>Add
						</button>
						<button
							class="btn btn-success"
							type="button"
							@click="submitEntry"
							v-show="isUpdate"
						>Update
						</button>
						<bootstrap-alert />
					</div>
				</div>
			</div>
		</Modal>
	</section>
</template>

<script>
	import { mapGetters, mapActions } from 'vuex';
	var checkIn = 0;
	var checkOut = 0;
	var duration = 0;

	export default {
		props: ["data", "project", "checkins"],
		data() {
			return {
				// modal
				isModalVisible: false,
				isEntryModalVisible: false,
				isCheckinModalVisible: false,
				isTimeModalVisible: false,
				isCompleteCheckin: false,
				isAbsent: false,
				isActive: false,
				isUpdate: false,
				checkinId: "",
				checkinday: "",
				entryDate: "",
				entryCostCode: "",
				entryTimeType: "",
				entryHours: "",
				entryMinutes: "",
				entryTool: "",
				entryClassification: "",
				entryNotes: "",
				timeTypes: "",
				checkinHours: "",
				checkinMinutes: "",
				checkoutHours: "",
				checkoutMinutes: "",
				time: {
					in: {
					hours: "",
					},
					out: {
					hours: "",
					},
				},
				hours: "",
				minutes: "",
				entry: "",
				checkinDate: "",
				title: "",
				selectedUser: "",
				assignedUsers: "",
			};
		},
		computed: {
			...mapGetters("Alert", ["message", "errors", "color"]),
			...mapGetters("TimecardsIndex", ["weekData", "checkinsData", "offsetWeek"]),
			...mapGetters('ProjectsSafetyCreate', ['item', 'loading', 'usersAll']),
			...mapGetters('ProjectsSingle', ['assignedUserList']),
		},
		beforeCreate() {},
		created() {
			this.timeTypes = [
			"Double Time - DT",
			"Drive Time - DRV",
			"Drive Time Passanger - DRVP",
			"Holiday- H",
			"Overtime - OT",
			"Regular Time - RT",
			"Time and a Half - 1.5",
			];
			this.fetchusersAll();
		},
		updated(){
			$('.v-select input').prop('required', true)
			if ($('.selected-tag').length > 0){
				$('.v-select input').prop('required', false)
			}
  		},
		mounted(){
			var hours = 0;
			var mins = 0;
			var seconds = 0;
			var timex = 0;

			$('#start').click(function(){
				startTimer();
				$('#stop').attr('disabled', false);
				$(this).attr('disabled', 'disabled');
				$('#reset').attr('disabled', true);
				checkIn = new Date().getHours()*60 + new Date().getMinutes();
			});

			$('#stop').click(function(){
				clearTimeout(timex);
				$('#start').attr('disabled', false);
				$(this).attr('disabled', 'disabled');
				$('#reset').attr('disabled', false);
				duration = hours*60 + mins;
				checkOut = checkIn + duration;
			});

			$('#reset').click(function(){
				hours = 0;
				mins = 0;
				seconds = 0;
				$('#hours').html('00:');
				$('#mins').html('00:');
				$('#seconds').html('00');
			});

			function startTimer(){
				timex = setTimeout(function(){
					seconds++;
					if(seconds > 59){
						seconds = 0;
						mins++;
						if(mins > 59) {
							mins = 0;
							hours++;
							if(hours < 10) {
								$("#hours").text('0'+hours+':')
							}
							else $("#hours").text(hours+':');
						}
						if(mins<10){
							$("#mins").text('0'+mins+':');
						}
						else $("#mins").text(mins+':');
					}
					if(seconds <10) {
						$("#seconds").text('0'+seconds);
					}
					else {
						$("#seconds").text(seconds);
					}
					startTimer();
				}, 1000);
			};

			this.assignedUsers = this.$route.params.users;
		},
		destroyed() {
			this.resetState();
		},
		watch: {
			"$route.params.id": function () {
				this.resetState();
			},
		},
		methods: {
			...mapActions("Alert", ["resetState"]),
			...mapActions("TimecardsIndex", [
				"newAddEntry",
			]),
			...mapActions('ProjectsSafetyCreate', [
				'fetchusersAll',
				'setMentor',
				'setProjecID',
			]),
			...mapActions('ProjectsSingle', ['fetchAssignedUserList']),
			handleTimecard: function (e) {
				e.preventDefault();

				this.showEntryModal();
			},
			showEntryModal(date) {
				this.entryDate = date;
				this.isEntryModalVisible = true;
			},
			submitEntry() {
				console.log("AAA", this.selectedUser);
				let today = new Date().toLocaleDateString('en-CA');
				this.newAddEntry({
					isUpdate: false,
					userId: this.selectedUser,
					projectId: this.$route.params.id,
					checkin: checkIn,
					checkout: checkOut,
					entryCostCode: this.entryCostCode,
					entryTimeType: this.entryTimeType,
					entryDuration: duration,
					entryNotes: this.entryNotes,
					entryDate: today,
				});
				this.closeEntryModal();
			},
			closeEntryModal() {
				this.entry = "";
				this.isEntryModalVisible = false;
				this.isUpdate = false;
				this.entryCostCode = "";
				this.entryTimeType = "";
				this.entryHours = "";
				this.entryMinutes = "";
				this.entryTool = "";
				this.entryClassification = "";
				this.entryNotes = "";
				this.isCompleteCheckin = false;
			},
			updateValue(key, value) {
				this.$emit("input", { ...this.entry, [key]: value });
			},
			updateMentor(value) {
				this.setMentor(value.id)
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

	#timer {
	font-size:75px;
	margin:0 auto;
	max-width:295px
	}

	#controls {
	margin:0 auto;
	max-width:280px;
	}

	#controls button {
	font-size:24px;
	border-radius: 20%;
	padding: 5px 20px;
	color: #fff !important;
	}
	#controls #start {
		background-color: #28a745;
	}
	#controls #stop {
		background-color: #dc3545;
	}
	#controls #reset {
		background-color: #007bff;
	}
	#submits {
		margin: 20px auto;
		max-width: 150px;
	}
	#submits #submit-btn {
		background-color: #e66c0e;
		padding: 10px 25px;
		border-radius: 50%;
		font-size: 30px;
	}
	#submits #submit-btn a {
		color: #fff;
	}
	section.timer {
		padding-top: 100px;
	}
</style>
<style scoped></style>
