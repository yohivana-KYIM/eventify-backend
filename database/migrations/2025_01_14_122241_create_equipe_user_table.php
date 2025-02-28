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
        Schema::create('equipe_user', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('equipe_id');
            $table->unsignedBigInteger('user_id');
            $table->timestamps();

            $table->foreign('equipe_id')->references('id')->on('equipes')->onDelete('cascade');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');

             $table->unique(['equipe_id', 'user_id']); // Empêche les doublons
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('equipe_user');
    }
};