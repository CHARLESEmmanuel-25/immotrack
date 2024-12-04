import client from '../config/client.js'

const mainDatamapper = {

    allProperties : async ()=>{
        let conn;
        conn = await client.getConnection();
        // Effectuer la requête SQL
        const res = await conn.query("SELECT * FROM propriete");
        return res;  // Retourne les résultats
    },

    searchEngine: async (query) => {
        let conn;
        try {
            conn = await client.getConnection();
            
            
            const sql = `
            SELECT * 
            FROM propriete 
            WHERE Nom LIKE ? 
            LIMIT 10`;  

            const params = [`%${query}%`]; 
    
            const [rows] = await conn.query(sql, params);
            return rows;
        } catch (error) {
            console.error("Error in searchEngine:", error);
            throw error; 
        } finally {
            if (conn) conn.release();
        }
    }
    
    

};

export default mainDatamapper;