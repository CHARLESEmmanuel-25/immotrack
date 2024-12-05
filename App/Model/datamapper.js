import client from '../config/client.js'

const mainDatamapper = {

    allProperties : async ()=>{
        const res = await client.query(`SELECT * FROM "propriete"`);
        return res.rows;
    },

    createProp : async (obj)=>{
        const query = {
            text: `INSERT INTO "propriete" (Nom, Prix_Propriete, Dimension, Description_Propriete, Piscine, Meuble, Jardin, poster,Ville,Adresse,CodePostal,Region,statut,Nombre_Piece)
                   VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14) RETURNING *`,
            values: [
                obj.Nom,
                obj.Prix_Propriete,
                obj.Dimension,
                obj.Description_Propriete,
                obj.Piscine,
                obj.Meuble,
                obj.Jardin,
                obj.poster,
                obj.Ville,
                obj.Adresse,
                obj.CodePostal,
                obj.Region,
                obj.statut,
                obj.Nombre_Piece
            
            ]
        };
        const result = await client.query(query);
        return result.rows[0];
    }
    

   
};

export default mainDatamapper;