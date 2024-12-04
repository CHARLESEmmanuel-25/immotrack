import mariadb from 'mariadb';

// Création du pool de connexions
const client = mariadb.createPool({
    host: 'localhost',
    user: 'root',
    password: '', // Assurez-vous de renseigner un mot de passe sécurisé si nécessaire
    database: 'GRP',
    
});

export default client;


