import client from '../config/client.js'

const mainDatamapper = {

    allProperties : async ()=>{
        let conn;
        conn = await client.getConnection();
        // Effectuer la requête SQL
        const res = await conn.query("SELECT * FROM propriete");
        return res;  // Retourne les résultats
    },

};

export default mainDatamapper;