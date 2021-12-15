<?php

namespace App\Models;
use Illuminate\Support\Facades\DB;

use Illuminate\Database\Eloquent\Model;

class Safety extends Model
{
  protected $fillable = [
    'project_id',
    'user_id',
    'created_by',
    'pic',
    'phone',
    'sse',
    'mentor',
    'jobsteps',
    'requirements',
    'area',
    'attachments',
    'signs',
    'created_at',
    'updated_at'
  ];

  
 
}
