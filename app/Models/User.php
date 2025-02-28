<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = [
        'prenom',
        'nom',
        'email',
        'role_id',
        'statut',
        'password',
    ];


    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
         'password' => 'hashed',
    ];


    public function role()
    {
        return $this->belongsTo(Role::class);
    }

    public function sentMessages()
    {
        return $this->hasMany(Chat::class, 'idEnvoyeur');
    }
    public function receivedMessages()
    {
       return $this->hasMany(Chat::class, 'idReceveur');
    }
    public function tickets() {
        return $this->hasMany(Ticket::class, 'assigneA');
    }

    public function assignedTasks()
    {
      return $this->belongsToMany(Tache::class, 'user_tache');
    }
      public function assignedProjets()
    {
        return $this->belongsToMany(Projet::class, 'user_projet');
    }
      public function assignedEquipes()
    {
      return $this->belongsToMany(Equipe::class, 'equipe_user');
    }
}
