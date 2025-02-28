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
        Schema::create('taches', function (Blueprint $table) {
            $table->id();
            $table->string('nom');
            $table->string('description')->nullable();
            $table->date('dateDebut'); // IMPORTANT : Vérifiez ce nom de colonne
            $table->date('dateFin');   // IMPORTANT : Vérifiez ce nom de colonne
            $table->string('priorite')->nullable();
            $table->string('statut')->nullable();
            $table->unsignedBigInteger('projet_id');
            $table->timestamps();

            $table->foreign('projet_id')->references('id')->on('projets');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('taches');
    }
};
