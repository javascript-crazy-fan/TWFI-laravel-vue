<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Certificate extends Model
{
    use SoftDeletes;
    protected $fillable = [
        'user_id',
        'certificate_name',
        'certificate_description',
        'pdf_file'
    ];
    
    protected $dates = ['deleted_at'];
}
