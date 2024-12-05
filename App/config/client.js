import mariadb from 'mariadb';


import pg from 'pg';
import dotenv from 'dotenv';

dotenv.config();

const { Client } = pg;

const client = new Client({
  host: 'localhost',
  user: 'manu',
  database: 'immotrack_pro',
  password: '' ,
  port: 5432,
  
});

console.log(client.database, client.user);
// Connexion à la base de données avec gestion des erreurs
client.connect()
  .then(() => console.log("connexion à la base de données"))
  .catch(err => console.error("Erreur de connexion à la base de données", err));

export default client;

/* Création du pool de connexions
const client = mariadb.createPool({
    host: 'localhost',
    user: 'root',
    password: '', // Assurez-vous de renseigner un mot de passe sécurisé si nécessaire
    database: 'GRP',
    connectionLimit: 5
});

export default client; */


