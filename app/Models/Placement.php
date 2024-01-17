<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Placement extends Model
{
    use HasFactory;

    protected $guarded = [];
    public $keyType = "string";
    public $primaryKey = "id";
    public $incrementing = false;


    public function asset()
    {
       return $this->belongsTo(Asset::class);
    }
  
    public function building()
    {
      return $this->belongsTo(Building::class);
    }
  
    public function floor()
    {
      return $this->belongsTo(Floor::class);
    }
  
    public function room() 
    {
      return $this->belongsTo(Room::class);
    }

    public static function boot()
    {
        parent::boot();
        
        static::creating(function ($placement) {
            if (!$placement->code) {
                $lastPlacement = self::max('code');
                $code = 'PL';

                if ($lastPlacement) {
                    $code .= sprintf('%05d', substr($lastPlacement, -5) + 1);
                } else {
                    $code .= '00001'; 
                }

                $placement->code = $code;
            }
        });
    }

    public function getCodeNameAttribute()
    {
        return $this->code . ' - ' . $this->asset->name; 
    }
}
