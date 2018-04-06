<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Specie extends Model
{
    protected $table = 'specie';
    protected $primaryKey = 'id';
    public $incrementing = false;
    protected $fillable = [
        'id',
        'name_latin',
        'name_french',
        'edibility_id',
        'trophic_status_id',
        'biotope_id',
        'other_region',
        'confusion',
        'comment'
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