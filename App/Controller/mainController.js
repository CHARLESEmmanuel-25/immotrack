import mainDatamapper from '../Model/datamapper.js'

const mainController = {

    home: async (req, res) => {
        try {
            const properties = await mainDatamapper.allProperties();
            res.render('index', {properties} );
        } catch (error) {
            console.error("Erreur lors de la récupération des propriétés :", error.message);
            res.status(500).render('error', { message: "Une erreur est survenue lors de la récupération des propriétés." });
        }
    },
    
    addProp: async (req,res)=>{
        res.render('add');
    },

    editProp : async(req,res)=>{
        res.render('edit');
    },

    ajout : async(req, res)=>{
        
        const {Nom, Prix_Propriete, Dimension,Date_Ajout, Adresse, Description_Propriete,Piscine,Meuble,Jardin,Nombre_Piece } = req.body;

        // recuperer l'id de la localisation : 

        const idLoc = '1'; 

        const newPropriete = {
            Nom,
            Prix_Propriete,
            Adresse : localisation,
            Dimension,
            Date_Ajout,
            Description_Propriete,
            Piscine,
            Meuble,
            localisation : idLoc,
            Jardin,
            Nombre_Piece
        }

        const saveprop = await mainDatamapper.createProp(newPropriete);



        console.log(newPropriete);
        res.send('ok');
    }

 };
 

export default mainController;