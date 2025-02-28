<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\ProjetController;

// Authentification
Route::middleware('auth:sanctum')->post('logout', [AuthController::class, 'logout']);
Route::post('login', [AuthController::class, 'login'])->name('login');
Route::middleware('auth:sanctum')->get('me', [AuthController::class, 'me']);
Route::post('register', [AuthController::class, 'register']);
Route::post('forgot-password', [AuthController::class, 'forgotPassword']);

// Ressources API
Route::apiResources([
    'projets' => ProjetController::class, // Routes pour les projets
    // Autres ressources
    'users' => UserController::class,
    'roles' => RoleController::class,
    'taches' => TacheController::class,
    'permissions' => PermissionController::class,
    'equipes' => EquipeController::class,
    'chats' => ChatController::class,
    'clients' => ClientController::class,
    'tickets' => TicketController::class,
    'calendriers' => CalendrierController::class,
]);
