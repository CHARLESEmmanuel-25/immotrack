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

    ajout: async (req, res) => {
        try {
            const {ID_Propriete, Nom, Prix_Propriete, Dimension, Date_Ajout, Adresse, Description_Propriete,poster, Piscine, Meuble, Jardin, Nombre_Piece, ID_Statut, CodePostal, Region, Ville} = req.body;
    
            // Crée un objet pour la localisation
            const newLocalisation = {Ville, Adresse, CodePostal, Region };
            console.log(newLocalisation);
    
            // Crée un objet pour la propriété
            const newPropriete = {ID_Propriete, Nom, Prix_Propriete, Dimension, Date_Ajout, Description_Propriete, poster,Piscine, Meuble, Jardin, Nombre_Piece, ID_Statut };
    
           
    
            // Sauvegarde la propriété avec l'ID de localisation
            const saveprop = await mainDatamapper.createProp(newPropriete);
    
            console.log(saveloc);
            console.log(saveprop);
    
            res.status(201).send('Propriété ajoutée avec succès');
        } catch (error) {
            console.error(error);
            res.status(500).send('Erreur lors de l\'ajout de la propriété');
        }
    }
    
    

 };
 

export default mainController;