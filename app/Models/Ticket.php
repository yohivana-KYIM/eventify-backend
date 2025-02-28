<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    use HasFactory;

      protected $fillable = [
        'sujet',
        'description',
        'statut',
        'dateCreation',
        'assigneA',
    ];
    public function user() {
        return $this->belongsTo(User::class, 'assigneA');
    }
}