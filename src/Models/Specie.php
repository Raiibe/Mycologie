<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Specie extends Model
{
    protected $table = 'specie';
    protected $primaryKey = 'id';
    protected $fillable = [
        'name_latin',
        'name_french',
        'edibility_id',
        'trophic_status_id',
        'biotope_id',
        'other_region',
        'confusion',
        'creator_id'
    ];
    public $timestamps = true;

    public function getBiotope()
    {
        return $this->belongsTo(Biotope::class, 'biotope_id');
    }

    public function getEdibility()
    {
        return $this->belongsTo(Edibility::class, 'edibility_id');
    }

    public function getTrophicStatus()
    {
        return $this->belongsTo(TrophicStatus::class, 'trophic_status_id');
    }
}