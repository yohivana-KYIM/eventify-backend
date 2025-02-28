<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'prenom' => 'required|string',
            'nom' => 'required|string',
            'email' => 'required|string|email|unique:users',
            'password' => 'required|string|min:8',
            'role_id' => 'required|exists:roles,id'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 400);
        }

        $user = User::create([
            'prenom' => $request->prenom,
            'nom' => $request->nom,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role_id' => $request->role_id
        ]);

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'message' => 'User registered successfully',
            'data' => $user,
            'access_token' => $token,
            'token_type' => 'Bearer',
        ], 201);
    }

    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string|min:8',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Invalid data',
                'errors' => $validator->errors(),
            ], 400);
        }

        if (!Auth::attempt($request->only('email', 'password'))) {
            return response()->json([
                'message' => 'Invalid login credential',
            ], 401);
        }

        $user = User::where('email', $request->email)->first();
        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'message' => 'Login successfully',
            'data' => $user,
            'access_token' => $token,
            'token_type' => 'Bearer',
        ], 200);
    }

    public function logout(Request $request)
    {
        $request->user()->tokens()->delete();
        return response()->json([
            'message' => 'Logout successfully'
        ], 200);
    }

    public function forgotPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users,email'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Invalid data',
                'errors' => $validator->errors(),
            ], 400);
        }

        $user = User::where('email', $request->email)->first();

        $user->password = Hash::make(Str::random(8));
        $user->save();

        return response()->json([
            'message' => 'Your new password has been generated, Please check your email'
        ], 200);
    }

    /**
     * Récupération des informations de l'utilisateur connecté
     */
    public function me(Request $request)
    {
        $user = $request->user(); // Récupération de l'utilisateur connecté
        return response()->json([
            'message' => 'Informations de l\'utilisateur récupérées avec succès.',
            'data' => $user,
        ], 200);
    }
}
