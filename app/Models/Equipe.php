<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Equipe extends Model
{
    use HasFactory;
    protected $fillable = [
        'nom',
        'description',
    ];

    public function users() {
       return $this->belongsToMany(User::class, 'equipe_user');
    }
     public function projets()
    {
        return $this->belongsToMany(Projet::class, 'projet_equipe');
    }
}