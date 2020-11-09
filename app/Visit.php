<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Visit extends Model
{
    protected $fillable = [
        'idh', 'idu', 'fecha', 'visits',
    ];
}
