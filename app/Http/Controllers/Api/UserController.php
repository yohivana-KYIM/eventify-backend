<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
          $users = User::with('role','assignedTasks','assignedProjets','assignedEquipes')->get();
         return response()->json(['data'=>$users], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
          $validator = Validator::make($request->all(), [
             'prenom' => 'required|string',
             'nom' => 'required|string',
             'email' => 'required|string|unique:users,email',
             'role_id' => 'required|exists:roles,id',
             'password' => 'required|string|min:8',

        ]);
       if($validator->fails()){
            return response()->json([
               'message' => 'invalid data',
               'errors' => $validator->errors(),
            ], 400);
        }
         $user = User::create([
             'prenom' => $request->prenom,
             'nom' => $request->nom,
             'email' => $request->email,
             'role_id' => $request->role_id,
             'password' =>  Hash::make($request->password),

         ]);
           return response()->json([
                'message' => 'User created successfully',
                'data' => $user
           ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
          $user = User::with('role','assignedTasks','assignedProjets','assignedEquipes')->find($id);
        if(!$user) {
            return response()->json([
                'message' => 'User not found',
           ], 404);
        }
         return response()->json(['data'=>$user], 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
         $validator = Validator::make($request->all(), [
             'prenom' => 'string',
             'nom' => 'string',
             'email' => 'string|unique:users,email,'.$id,
             'role_id' => 'exists:roles,id',
            'password' => 'string|min:8',

        ]);
       if($validator->fails()){
            return response()->json([
               'message' => 'invalid data',
               'errors' => $validator->errors(),
            ], 400);
        }
        $user = User::find($id);
        if(!$user) {
             return response()->json([
                'message' => 'User not found',
           ], 404);
        }
          $user->update([
             'prenom' => $request->input('prenom', $user->prenom),
             'nom' => $request->input('nom', $user->nom),
              'email' => $request->input('email', $user->email),
               'role_id' => $request->input('role_id', $user->role_id),
               'password' =>  $request->input('password') ?  Hash::make($request->password) : $user->password,
         ]);
        return response()->json([
             'message' => 'User updated successfully',
              'data' => $user
           ], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $user = User::find($id);
        if(!$user) {
             return response()->json([
                'message' => 'User not found',
           ], 404);
        }
        $user->delete();
        return response()->json(['message'=>'User deleted successfully'], 200);
    }
}
