<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TrophicStatus extends Model
{
    protected $table = 'trophic_status';
    protected $primaryKey = 'id';
    public $incrementing = false;
    protected $fillable = [
        'status'
    ];
    public $timestamps = true;

    public function getSpecies()
    {
        return $this->hasMany(Specie::class, 'trophic_status_id');
    }
}