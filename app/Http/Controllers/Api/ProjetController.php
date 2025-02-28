<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Projet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProjetController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $projets = Projet::with(['taches', 'equipes', 'users'])->get();
        return response()->json($projets);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'nom' => 'required|string|max:255',
            'description' => 'nullable|string',
            'dateDebut' => 'required|date',
            'dateFin' => 'required|date|after_or_equal:dateDebut',
            'budget' => 'nullable|numeric',
            'priorite' => 'nullable|string|in:Haute,Moyenne,Basse',
            'statut' => 'nullable|string|in:En cours,Terminé,Suspendu',
            'commentaire' => 'nullable|string',
            'piece_jointe' => 'nullable|file|mimes:jpg,jpeg,png,gif,mp4,avi,mov,pdf,doc,docx|max:20480', // 20MB max
        ]);

        if ($request->hasFile('piece_jointe')) {
            $path = $request->file('piece_jointe')->store('projets/pieces_jointes', 'public');
            $validatedData['piece_jointe'] = $path;
        }

        $projet = Projet::create($validatedData);

        return response()->json([
            'message' => 'Projet créé avec succès.',
            'projet' => $projet,
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $projet = Projet::with(['taches', 'equipes', 'users'])->findOrFail($id);
        return response()->json($projet);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $projet = Projet::findOrFail($id);

        $validatedData = $request->validate([
            'nom' => 'sometimes|required|string|max:255',
            'description' => 'nullable|string',
            'dateDebut' => 'sometimes|required|date',
            'dateFin' => 'sometimes|required|date|after_or_equal:dateDebut',
            'budget' => 'nullable|numeric',
            'priorite' => 'nullable|string|in:Haute,Moyenne,Basse',
            'statut' => 'nullable|string|in:En cours,Terminé,Suspendu',
            'commentaire' => 'nullable|string',
            'piece_jointe' => 'nullable|file|mimes:jpg,jpeg,png,gif,mp4,avi,mov,pdf,doc,docx|max:20480', // 20MB max
        ]);

        if ($request->hasFile('piece_jointe')) {
            // Supprimer l'ancienne pièce jointe si elle existe
            if ($projet->piece_jointe) {
                Storage::disk('public')->delete($projet->piece_jointe);
            }

            $path = $request->file('piece_jointe')->store('projets/pieces_jointes', 'public');
            $validatedData['piece_jointe'] = $path;
        }

        $projet->update($validatedData);

        return response()->json([
            'message' => 'Projet mis à jour avec succès.',
            'projet' => $projet,
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
         public function destroy(string $id)
    {
         $projet = Projet::findOrFail($id);

        // Supprimer la pièce jointe si elle existe
        if ($projet->piece_jointe) {
            Storage::disk('public')->delete($projet->piece_jointe);
        }
        if ($projet->calendriers()->count() > 0) {
            return response()->json([
                'message' => 'Cannot delete project, calendars associated with it still exists.',
            ], 400);
        }

        $projet->delete();


        return response()->json([
            'message' => 'Projet supprimé avec succès.',
        ]);
    }
}

