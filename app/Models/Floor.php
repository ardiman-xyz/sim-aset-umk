<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Floor extends Model
{
    use HasFactory;

    public function building(): BelongsTo
    {
        return $this->belongsTo(Building::class, "building_id");
    }

    public function rooms(): HasMany
    {
        return $this->hasMany(Room::class, "floor_id");
    }
}
