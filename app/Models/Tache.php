<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tache extends Model
{
    use HasFactory;
     protected $fillable = [
        'nom',
        'description',
        'dateDebut',
        'dateFin',
        'priorite',
         'statut',
        'projet_id'
    ];
    public function projet()
    {
        return $this->belongsTo(Projet::class);
    }
      public function calendriers()
    {
        return $this->hasMany(Calendrier::class);
    }
      public function users() {
       return $this->belongsToMany(User::class, 'user_tache');
    }
}
