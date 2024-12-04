import client from '../config/client.js'

const mainDatamapper = {

    allProperties: async () => {
        let conn;
        conn = await client.getConnection();
        // Effectuer la requête SQL
        const res = await conn.query("SELECT * FROM propriete");
        return res;  // Retourne les résultats
    },


    createProp: async (newPropriete) => {
        const conn = await client.getConnection(); // ou une logique similaire

        const query = {
            text: `
            INSERT INTO propriete (ID_Propriete,Nom, Prix_Propriete, Dimension, Date_Ajout, Description_Propriete,poster, Piscine, Meuble, Jardin, Nombre_Piece, ID_Statut,ID_TRANSAC)
            VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13)`,
            values: [
                newPropriete.ID_Propriete,
                newPropriete.Nom,
                newPropriete.Prix_Propriete,
                newPropriete.Dimension,
                newPropriete.Date_Ajout,
                newPropriete.Description_Propriete,
                newPropriete.poster,
                newPropriete.Piscine,
                newPropriete.Meuble,
                newPropriete.Jardin,
                newPropriete.Nombre_Piece,
                newPropriete.ID_Statut,
                newPropriete.ID_TRANSAC, 
 
            ]
        };

        const result = await conn.query(query);
        return result.rows;
    }
};

export default mainDatamapper;
