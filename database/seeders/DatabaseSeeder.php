<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {

        DB::table('roles')->insert([
            ['nom' => 'Administrateur', 'description' => 'Administrateur du system'],
            ['nom' => 'ChefDeProjet', 'description' => 'Chef de project'],
            ['nom' => 'MembreEquipe', 'description' => 'Membre de l\'équipe']

        ]);
       DB::table('permissions')->insert([
            ['nom' => 'creer_users', 'description' => 'Peut creer users'],
            ['nom' => 'update_users', 'description' => 'Peut mettre a jour users'],
             ['nom' => 'supprimer_users', 'description' => 'Peut supprimer users'],
             ['nom' => 'list_users', 'description' => 'Peut list users'],
           ['nom' => 'creer_projet', 'description' => 'Peut creer projet'],
            ['nom' => 'update_projet', 'description' => 'Peut mettre a jour projet'],
             ['nom' => 'supprimer_projet', 'description' => 'Peut supprimer projet'],
             ['nom' => 'list_projet', 'description' => 'Peut list projet'],
          ['nom' => 'creer_tache', 'description' => 'Peut creer tache'],
            ['nom' => 'update_tache', 'description' => 'Peut mettre a jour tache'],
             ['nom' => 'supprimer_tache', 'description' => 'Peut supprimer tache'],
             ['nom' => 'list_tache', 'description' => 'Peut list tache'],

        ]);
       DB::table('role_permission')->insert([
            ['role_id' => '1', 'permission_id' => '1'],
              ['role_id' => '1', 'permission_id' => '2'],
              ['role_id' => '1', 'permission_id' => '3'],
              ['role_id' => '1', 'permission_id' => '4'],
               ['role_id' => '1', 'permission_id' => '5'],
              ['role_id' => '1', 'permission_id' => '6'],
              ['role_id' => '1', 'permission_id' => '7'],
              ['role_id' => '1', 'permission_id' => '8'],
               ['role_id' => '1', 'permission_id' => '9'],
              ['role_id' => '1', 'permission_id' => '10'],
              ['role_id' => '1', 'permission_id' => '11'],
              ['role_id' => '1', 'permission_id' => '12'],

             ['role_id' => '2', 'permission_id' => '5'],
              ['role_id' => '2', 'permission_id' => '6'],
              ['role_id' => '2', 'permission_id' => '7'],
               ['role_id' => '2', 'permission_id' => '8'],
            ['role_id' => '2', 'permission_id' => '9'],
              ['role_id' => '2', 'permission_id' => '10'],
              ['role_id' => '2', 'permission_id' => '11'],
               ['role_id' => '2', 'permission_id' => '12'],

            ['role_id' => '3', 'permission_id' => '9'],
              ['role_id' => '3', 'permission_id' => '10'],
              ['role_id' => '3', 'permission_id' => '11'],
               ['role_id' => '3', 'permission_id' => '12'],
        ]);


        DB::table('users')->insert([
            [
                'prenom' => 'Admin',
                'nom' => 'Admin',
                'email' => 'admin@example.com',
                'role_id' => '1',
                'password' => Hash::make('password'),
            ],
              [
                'prenom' => 'Chef',
                'nom' => 'Chef',
                'email' => 'chef@example.com',
                'role_id' => '2',
                 'password' => Hash::make('password'),
            ],
             [
                'prenom' => 'Membre',
                'nom' => 'Membre',
                'email' => 'membre@example.com',
                'role_id' => '3',
                'password' => Hash::make('password'),
            ],
        ]);

      DB::table('projets')->insert([
            [
                'nom' => 'Gestion de projet',
                'description' => 'Creation application gestion de projet',
                'dateDebut' => '2024-01-01',
                'dateFin' => '2024-12-31',
                 'budget' => '100000',
                'priorite' => 'haute',
                 'statut' => 'en cours',
            ]
      ]);

     DB::table('equipes')->insert([
            [
                'nom' => 'Equipe de dev',
                'description' => 'Equipe charge de developpement',
            ]
      ]);

        DB::table('taches')->insert([
            [
                'nom' => 'Creation Models',
                'description' => 'creation de tous les models de l\'app',
                'dateDebut' => '2024-01-01',
                'dateFin' => '2024-01-02',
                'priorite' => 'haute',
                 'statut' => 'en cours',
                 'projet_id' => '1'
            ]
         ]);

          DB::table('calendriers')->insert([
            [
               'projet_id' => '1',
               'tache_id' => '1',
               'dateEvenement' => '2024-01-01'
            ]
         ]);

         DB::table('user_tache')->insert([
            [
                'user_id' => '3',
                'tache_id' => '1'
            ]
        ]);
         DB::table('user_projet')->insert([
            [
                'user_id' => '2',
                'projet_id' => '1'
            ]
        ]);
          DB::table('projet_equipe')->insert([
            [
                'projet_id' => '1',
                'equipe_id' => '1'
            ]
        ]);
       DB::table('equipe_user')->insert([
            [
                'user_id' => '3',
                'equipe_id' => '1'
            ]
        ]);


    }
}
