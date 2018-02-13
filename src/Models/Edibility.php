<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Edibility extends Model
{
    protected $table = 'edibility';
    protected $primaryKey = 'id';
    protected $fillable = [
        'status'
    ];
    public $timestamps = true;

    public function getSpecies()
    {
        return $this->hasMany(Specie::class, 'edibility_id');
    }
}