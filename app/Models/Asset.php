<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Str;

class Asset extends Model
{
    use HasFactory;

    protected $table = "assets";
    public $guarded = [];
    public $keyType = "string";
    public $primaryKey = "id";
    public $incrementing = false;

    protected static function boot(): void
    {
        parent::boot();

        static::creating(function ($model) {
            $model->{$model->getKeyName()} = Str::uuid();
        });
    }

    public function gallery(): HasMany
    {
        return $this->hasMany(Gallery::class);
    }

    public function categories(): BelongsToMany
    {
        return $this->belongsToMany(Category::class, 'asset_categories', 'asset_id', 'category_id');
    }

    public function acquisitionMethod(): BelongsTo
    {
        return $this->belongsTo(AcquisitionMethod::class);
    }

    public function condition(): BelongsTo
    {
        return $this->belongsTo(Condition::class);
    }
}
