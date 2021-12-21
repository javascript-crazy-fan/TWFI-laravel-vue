<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Project;
use App\Models\Safety;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Auth;

class ProjectController extends Controller
{
	public function index()
	{
		$data = Project::all();
		return response()->json($data);
	}

	public function store(Request $request)
	{
		// ---------- Begin validation -----------------------------
		if (!$request->filled('project')) {
			return response()->json([
				'status' => false,
				'msg' => 'Please input Project name'
			]);
		}

		if (!$request->filled('project_number')) {
			return response()->json([
				'status' => false,
				'msg' => 'Please input Project number'
			]);
		}

		if (!$request->filled('start_date')) {
			return response()->json([
				'status' => false,
				'msg' => 'Please input Start date'
			]);
		}
		// ---------- End validation --------------------------------

		$project = Project::create([
			'project' => $request->project,
			'project_number' => $request->project_number,
			'status' => $request->status,
			'start_date' => $request->start_date,
			'end_date' => $request->end_date,
			'country' => $request->country,
			'address' => $request->address,
			'city' => $request->city,
			'region' => $request->region,
			'postal_code' => $request->postal_code,
			'longitude' => $request->longitude,
			'latitude' => $request->latitude
		]);

		return response()->json([
			'status' => true,
			'project' => $project
		]);
	}

	public function show($id)
	{
		$project = Project::find($id);
		return response()->json($project);
	}

	public function update(Request $request, $id)
	{
		$project = Project::find($id);
		if ($project == null) {
			return response()->json([
				'status' => false,
				'msg' => 'Cannot find specific project'
			]);
		}

		// ---------- Begin validation -----------------------------
		if (!$request->filled('project')) {
			return response()->json([
				'status' => false,
				'msg' => 'Please input Project name'
			]);
		}

		if (!$request->filled('project_number')) {
			return response()->json([
				'status' => false,
				'msg' => 'Please input Project number'
			]);
		}

		if (!$request->filled('start_date')) {
			return response()->json([
				'status' => false,
				'msg' => 'Please input Start date'
			]);
		}
		// ---------- End validation --------------------------------

		$project->update([
			'project' => $request->project,
			'project_number' => $request->project_number,
			'status' => $request->status,
			'start_date' => $request->start_date,
			'end_date' => $request->end_date,
			'country' => $request->country,
			'address' => $request->address,
			'city' => $request->city,
			'region' => $request->region,
			'postal_code' => $request->postal_code,
			'longitude' => $request->longitude,
			'latitude' => $request->latitude
		]);

		return response()->json([
			'status' => true,
			'project' => $project
		]);
	}

	public function destroy($id)
	{
		$project = Project::find($id);
		if ($project == null) {
			return response()->json([
				'status' => false,
				'msg' => 'Cannot find specific project'
			]);
		}

		$project->delete();
		return response()->json([
			'status' => true,
			'msg' => 'Deleted project'
		]);
	}

	public function getAssignAll()
	{
		$sql = "SELECT
      `projects`.`id`,
      `projects`.`project`,
      `projects`.`project_number`,
      `projects`.`city`,
      `projects`.`region`,
      `projects`.`address`,
      `projects`.`country`,
      `projects`.`start_date`,
      `projects`.`end_date`,
      `users`.`id` `user_id`,
      `users`.`first_name`,
      `users`.`avatar`
    FROM
      `projects`
      LEFT JOIN `project_assign_projects`
        ON `project_assign_projects`.`project_id` = `projects`.`id`
      LEFT JOIN `project_assign_users`
        ON `project_assign_users`.`assign_id` = `project_assign_projects`.`assign_id`
      LEFT JOIN `users`
        ON `users`.`id` = `project_assign_users`.`user_id`
    ";
		$data = DB::select($sql);

		$retData = [];
		foreach ($data as $row) {
			for ($i = count($retData) - 1; $i >= 0; $i -= 1) {
				if ($retData[$i]['id'] == $row->id) {
					break;
				}
			}

			if ($i > -1) {
				if (!is_array($retData[$i]['users'])) {
					$retData[$i]['users'] = [];
				}
				array_push($retData[$i]['users'], [
					'id' => $row->id,
					'first_name' => $row->first_name,
					'avatar' => $row->avatar
				]);
			} else {
				$row1 = [
					'id' => $row->id,
					'project' => $row->project,
					'project_number' => $row->project_number,
					'city' => $row->city,
					'region' => $row->region,
					'address' => $row->address,
					'country' => $row->country,
					'start_date' => $row->start_date,
					'end_date' => $row->end_date,
					'users' => []
				];

				if ($row->user_id != null) {
					array_push($row1['users'], [
						'id' => $row->user_id,
						'first_name' => $row->first_name,
						'avatar' => $row->avatar
					]);
				}
				array_push($retData, $row1);
			}
		}
		return response()->json($retData);
	}

	public function getAssignedUserList($projectId)
	{
		$project = Project::find($projectId);
		$data = $project->getAssignedUserList($projectId);
		return response()->json($data);
	}

	public function safety($id, Request $request)
	{
		$start_date = $request->start_date;
		$end_date = $request->end_date;
		$created_by = $request->created_by;
		$data = DB::table('safeties')
			->join('users', 'safeties.mentor', '=', 'users.id')
			->select('safeties.*', DB::raw('CONCAT(users.first_name, " ", users.last_name) AS full_name'))
			->where('safeties.project_id', '=', $id);

		if (!empty($start_date && $end_date) || !empty($created_by)) {
			if (!empty($start_date && $end_date)) {
				$data->whereDate('safeties.created_at', '>=', $start_date);
				$data->whereDate('safeties.created_at', '<=', $end_date);
			}

			if (!empty($created_by)) {
				$data->where('safeties.user_id', '=', $created_by);
			}
		}

		$result = $data->get();
		return response()->json($result);
	}

	public function getUsers()
	{
		$result = User::get();
		$data = array();
		$i = 0;

		foreach ($result as $res) {
			$data[$i]['id'] = $res['id'];
			$data[$i]['title'] = $res['first_name'] . ' ' . $res['last_name'];

			$i++;
		}

		return response()->json($data);
	}

	public function storeSafety(Request $request)
	{

		$user = Auth::user();

		$postData = array();
		$jobData = array();
		$signData = array();
		$postData['pic'] = $request->pic;
		$postData['phone'] = $request->phone;
		$postData['sse'] = $request->sse;
		$postData['mentor'] = $request->mentor;

		$postData['jobsteps'] = serialize($request->jobsteps);
		$postData['requirements'] = $request->requirements;
		$postData['area'] = $request->area;
		$postData['attachments'] = $request->attachments;

		$i = 0;

		foreach ($request->signs as $sign) {
			if ($sign['signature'] != '') {
				$image = $sign['signature'];  // your base64 encoded
				$image = str_replace('data:image/png;base64,', '', $image);
				$image = str_replace(' ', '+', $image);
				$imageName = str_random(10) . '.' . 'png';
				\File::put(storage_path('app/public') . DIRECTORY_SEPARATOR . 'signatures' . '/' . $imageName, base64_decode($image));
				$signData[$i]['signature'] = 'signatures/' . $imageName;

				$signData[$i]['type_name'] = $sign['type_name'];
			}
			$i++;
		}

		$postData['signs'] = serialize($signData);
		$postData['project_id'] = $request->project_id;
		$postData['created_by'] = $user->first_name . ' ' . $user->last_name;
		$postData['user_id'] = $user->id;

		$saftey = Safety::create([
			'project_id' => $postData['project_id'],
			'user_id' => $postData['user_id'],
			'created_by' => $postData['created_by'],
			'pic' => $postData['pic'],
			'phone' => $postData['phone'],
			'sse' => $postData['sse'],
			'mentor' => $postData['mentor'],
			'jobsteps' => $postData['jobsteps'],
			'requirements' => $postData['requirements'],
			'area' => $postData['area'],
			'attachments' => $postData['attachments'],
			'signs' => $postData['signs'],
			'created_at' => date('Y-m-d h:i:s'),
			'updated_at' => date('Y-m-d h:i:s')
		]);

		return response()->json([
			'status' => true,
			'saftey' => $saftey,
			'projectId' => $request->project_id
		]);
	}

	public function safety_delete($id)
	{
		$safety = Safety::find($id);
		if ($safety == null) {
			return response()->json([
				'status' => false,
				'msg' => 'Cannot find specific form'
			]);
		}
		$signs = unserialize($safety->signs);
		$signArr = array();
		for ($i = 0; $i < count($signs); $i++) {
			if (\Storage::disk('public')->exists($signs[$i]['signature']))
				\Storage::disk('public')->delete($signs[$i]['signature']);
		}
		$safety->delete();
		return response()->json([
			'status' => true,
			'msg' => 'Deleted safety form'
		]);
	}

	public function getSafety($id)
	{
		$safety = Safety::find($id);
		$safety['jobsteps'] = unserialize($safety->jobsteps);
		$signs = unserialize($safety->signs);
		$signArr = array();
		for ($i = 0; $i < count($signs); $i++) {
			$signArr[$i]['uid'] = 'si_' . $i;
			$signArr[$i]['signature'] = $signs[$i]['signature'];
			$signArr[$i]['type_name'] = $signs[$i]['type_name'];
		}

		$safety['signs'] = $signArr;
		return response()->json($safety);
	}

	public function editSafety(Request $request, $id)
	{

		$safety = Safety::find($id);
		if ($safety == null) {
			return response()->json([
				'status' => false,
				'msg' => 'Cannot find specific form'
			]);
		}

		$signData = Safety::where('id', '=', $id)->value('signs');

		$signData = unserialize($signData);

		$preSings = array();
		foreach ($signData as $data) {
			array_push($preSings, $data['signature']);
		}


		$i = 0;
		$signDataNew = array();
		$preSignArr = array();
		foreach ($request->signs as $sign) {
			if ($sign['signature'] != '') {
				if (strpos($sign['signature'], 'data:image/png;base64') !== false) {
					$image = $sign['signature'];  // your base64 encoded
					$image = str_replace('data:image/png;base64,', '', $image);
					$image = str_replace(' ', '+', $image);
					$imageName = str_random(10) . '.' . 'png';
					\File::put(storage_path('app/public') . DIRECTORY_SEPARATOR . 'signatures' . '/' . $imageName, base64_decode($image));
					$signDataNew[$i]['signature'] = 'signatures/' . $imageName;

					$signDataNew[$i]['type_name'] = $sign['type_name'];
				} else {
					$signDataNew[$i]['signature'] = $sign['signature'];
					$signDataNew[$i]['type_name'] = $sign['type_name'];
					array_push($preSignArr, $sign['signature']);
				}
			}
			$i++;
		}

		$currentSigns = array();
		foreach ($preSignArr as $dd) {
			array_push($currentSigns, $dd);
		}

		$firstArr = array_diff($currentSigns, $preSings);

		if (!empty($firstArr)) {
			foreach ($firstArr as $first) {
				if (\Storage::disk('public')->exists($first))
					\Storage::disk('public')->delete($first);
			}
		}

		$secondArr = array_diff($preSings, $currentSigns);

		if (!empty($secondArr)) {

			foreach ($secondArr as $second) {
				if (\Storage::disk('public')->exists($second))
					\Storage::disk('public')->delete($second);
			}
		}


		$safety->update([
			'project_id' => $request->project_id,
			'pic' => $request->pic,
			'phone' => $request->phone,
			'sse' => $request->sse,
			'mentor' => $request->mentor,
			'jobsteps' => serialize($request->jobsteps),
			'requirements' => $request->requirements,
			'area' => $request->area,
			'attachments' => $request->attachments,
			'signs' => serialize($signDataNew),
			'updated_at' => date('Y-m-d h:i:s')
		]);

		return response()->json([
			'status' => true,
			'safety' => $safety
		]);
	}
}