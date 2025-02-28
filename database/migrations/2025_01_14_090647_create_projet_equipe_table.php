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
        Schema::create('projet_equipe', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('projet_id');
            $table->unsignedBigInteger('equipe_id');
            $table->timestamps();

            $table->foreign('projet_id')->references('id')->on('projets')->onDelete('cascade');
            $table->foreign('equipe_id')->references('id')->on('equipes')->onDelete('cascade');

             $table->unique(['projet_id', 'equipe_id']); // Empêche les doublons
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('projet_equipe');
    }
};