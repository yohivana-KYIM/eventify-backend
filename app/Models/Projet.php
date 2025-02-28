<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Projet extends Model
{
    use HasFactory;

    /**
     * Attributs mass-assignables.
     */
    protected $fillable = [
        'nom',
        'description',
        'dateDebut',
        'dateFin',
        'budget',
        'priorite',
        'statut',
        'commentaire', // Nouveau champ
        'piece_jointe', // Nouveau champ
    ];

    /**
     * Relation : Un projet a plusieurs tâches (one-to-many).
     */
    public function taches()
    {
        return $this->hasMany(Tache::class);
    }

    /**
     * Relation : Un projet a plusieurs calendriers (one-to-many).
     */
    public function calendriers()
    {
        return $this->hasMany(Calendrier::class);
    }

    /**
     * Relation : Plusieurs équipes peuvent travailler sur plusieurs projets (many-to-many).
     */
    public function equipes()
    {
        return $this->belongsToMany(Equipe::class, 'projet_equipe');
    }

    /**
     * Relation : Plusieurs utilisateurs peuvent participer à plusieurs projets (many-to-many).
     */
    public function users()
    {
        return $this->belongsToMany(User::class, 'user_projet');
    }
}
