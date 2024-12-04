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
    searchInput: async (req, res) => {
        try {
            // Récupérer le paramètre "query" depuis req.query ou req.params
            const { query } = req.params; // Si les données arrivent comme paramètres de requête
            // const { query } = req.params; // Utiliser ceci si les données arrivent comme segments de l'URL
            
            if (!query || query.trim() === "") {
                return res.status(400).json({ error: "Le paramètre 'query' est requis." });
            }
    
            console.log("Requête de recherche :", query);
    
            // Appeler la fonction de recherche dans la base de données
            const searchOnDB = await mainDatamapper.searchEngine(query);
    
            if (!searchOnDB || searchOnDB.length === 0) {
                return res.status(404).json({ message: "Aucun résultat trouvé." });
            }

            
            
            // Retourner les résultats au format JSON
            res.status(200).json({ searchOnDB });
        } catch (error) {
            console.error("Erreur lors de la recherche :", error.message);
            res.status(500).json({ error: "Une erreur est survenue. Veuillez réessayer." });
        }
    }
    
    

 };
 

export default mainController;