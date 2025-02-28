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
        Schema::create('calendriers', function (Blueprint $table) {
            $table->id();
             $table->unsignedBigInteger('projet_id');
             $table->unsignedBigInteger('tache_id');
            $table->date('dateEvenement');
            $table->timestamps();
              $table->foreign('projet_id')->references('id')->on('projets');
              $table->foreign('tache_id')->references('id')->on('taches');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('calendriers');
    }
};
