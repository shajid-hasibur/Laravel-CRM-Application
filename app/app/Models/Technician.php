<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Traits\Searchable;
use Illuminate\Database\Eloquent\Model;
use App\Constants\Status;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class Technician extends Model
{
    use Searchable;
    use HasFactory;

    protected $casts = [
        'address_data' => 'object',
        'rate' => 'object',
    ];

    public function skills()
    {
        return $this->belongsToMany(SkillCategory::class, 'technician_skills', 'technician_id', 'skill_id');
    }

    public function review()
    {
        return $this->belongsTo(Review::class, 'id', 'technician_id');
    }
    public function vendorList()
    {
        return $this->hasMany(VendorCareList::class, 'technician_id', 'id');
    }
    //scope
    public function scopeAssignedFtech($query)
    {
        return $query->where('available', Status::DISABLE);
    }
    public function scopeAvailableFtech($query)
    {
        return $query->where('available', Status::ENABLE);
    }
    public function scopeDocUnverifiedFtech($query)
    {
        return $query->where('coi_file', null)->where('msa_file', null)->where('nda_file', null);
    }
    public function scopeDocVerifiedFtech($query)
    {
        return $query->where('coi_file', '!=', null)->where('msa_file', '!=', !null)->where('nda_file', '!=', !null);
    }

    public function greatCircleDistance($latitude, $longitude)
    {
        $earthRadius = 6371;

        $lat1 = deg2rad($this->latitude);
        $lon1 = deg2rad($this->longitude);
        $lat2 = deg2rad($latitude);
        $lon2 = deg2rad($longitude);

        $dlat = $lat2 - $lat1;
        $dlon = $lon2 - $lon1;

        $a = sin($dlat / 2) ** 2 + cos($lat1) * cos($lat2) * sin($dlon / 2) ** 2;
        $c = 2 * atan2(sqrt($a), sqrt(1 - $a));

        $distance = $earthRadius * $c;

        return $distance;
    }

    // public function setMsaExpireDateAttribute($value)
    // {
    //     $date = Carbon::createFromFormat('d-m-Y', $value);
    //     $formattedDate = $date->format('Y-m-d');
    //     $this->attributes['msa_expire_date'] = $formattedDate;
    // }
}
