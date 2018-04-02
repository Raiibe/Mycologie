<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Edibility extends Model
{
    protected $table = 'edibility';
    protected $primaryKey = 'id';
    public $incrementing = false;
    protected $fillable = [
        'status'
    ];
    public $timestamps = true;

    public function getSpecies()
    {
        return $this->hasMany(Specie::class, 'edibility_id');
    }
}