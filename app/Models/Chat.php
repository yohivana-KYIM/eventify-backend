<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Chat extends Model
{
    use HasFactory;
    protected $fillable = [
       'message',
       'idEnvoyeur',
       'idReceveur',
       'horodatage',
    ];

  public function sender()
  {
      return $this->belongsTo(User::class, 'idEnvoyeur');
  }

  public function receiver()
    {
        return $this->belongsTo(User::class, 'idReceveur');
    }
}
