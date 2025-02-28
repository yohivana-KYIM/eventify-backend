<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('projets', function (Blueprint $table) {
            $table->id(); // Identifiant unique du projet
            $table->string('nom'); // Nom du projet
            $table->string('description')->nullable(); // Description du projet (facultative)
            $table->date('dateDebut'); // Date de début du projet
            $table->date('dateFin'); // Date de fin du projet
            $table->float('budget')->nullable(); // Budget alloué au projet (facultatif)
            $table->string('priorite')->nullable(); // Niveau de priorité (facultatif)
            $table->string('statut')->nullable(); // Statut du projet (facultatif)
            $table->text('commentaire')->nullable(); // Commentaire sur le projet (facultatif)
            $table->string('piece_jointe')->nullable(); // Pièce jointe (facultative)
            $table->timestamps(); // Colonnes 'created_at' et 'updated_at'
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('projets'); // Supprime la table 'projets'
    }
};
