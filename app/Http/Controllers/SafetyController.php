<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;
use PDF;
use App\Models\Safety;
use App\Models\Project;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class SafetyController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function pdf($id)
    {
        $row = Safety::where('id', '=', $id);
        
        $data = array();
        $data['pic'] = $row->value('pic');
        $data['phone'] = $row->value('phone');
        $data['sse'] = $row->value('sse');
        $mentor = $row->value('mentor');
        $user = User::where('id', '=', $mentor);
        $data['mentor'] = $user->value('first_name').' '.$user->value('last_name');
        $data['jobsteps'] = unserialize($row->value('jobsteps'));
        $data['requirements'] = $row->value('requirements');
        $data['area'] = $row->value('area');
        $data['attachments'] = $row->value('attachments');
        $data['signs'] = unserialize($row->value('signs'));
        $data['createdBy'] = $row->value('created_by');
        $data['createdDate'] = date('l, F jS, Y', strtotime($row->value('created_at')));
        $data['modifiedDate'] = date('l, F jS, Y', strtotime($row->value('updated_at')));

        $projectId = $row->value('project_id');

        $projectData = Project::where('id', '=', $projectId);
        $data['projectName'] = $projectData->value('project');
        $data['projectNumber'] = $projectData->value('project_number');
        $data['projectAddress'] = $projectData->value('address');
        $data['projectDate'] = date('l, F jS, Y', strtotime($projectData->value('created_at')));

        $pdf = PDF::loadView('pdf.document', $data);
        //return view('pdf.document', $data);
        return $pdf->stream('document.pdf');
        
    }
}
