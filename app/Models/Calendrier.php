<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Calendrier extends Model
{
    use HasFactory;
     protected $fillable = [
          'projet_id',
           'tache_id',
          'dateEvenement',
     ];
      public function projet() {
      return $this->belongsTo(Projet::class);
      }
    public function tache() {
        return $this->belongsTo(Tache::class);
    }
}

