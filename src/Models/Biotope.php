<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Biotope extends Model
{
    protected $table = 'biotope';
    protected $primaryKey = 'id';
    public $incrementing = false;
    protected $fillable = [
        'region'
    ];
    public $timestamps = true;

    public function getSpecies()
    {
        return $this->hasMany(Specie::class, 'biotope_id');
    }
}