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

    getaddProp : async(req,res)=>{

       res.render('add');

    },
    
    addProp: async (req,res)=>{
       
          try {

            const {Nom,Prix_Propriete,Dimension,Description_Propriete,Piscine,Meuble,Jardin,poster,Ville,Adresse,CodePostal,Region,statut,Nombre_Piece } = req.body;
           

            const obj = {
                Nom,
                Prix_Propriete,
                Dimension,
                Description_Propriete,
                Piscine,
                Meuble,
                Jardin, 
                poster,
                Ville,
                Adresse,
                CodePostal,
                Region,
                statut,
                Nombre_Piece

            }

            if (!Nom || !Prix_Propriete || !Dimension || !Description_Propriete || !Ville) {
                return res.status(400).send("Missing required fields");
            }
            
           await mainDatamapper.createProp(obj);

           res.render('add');

            
          } catch (error) {
            console.error("Error adding property:", error);
            res.status(500).send("Internal Server Error"); // Gestion des erreurs
          }
    
            
    },


    

 };
 

export default mainController;