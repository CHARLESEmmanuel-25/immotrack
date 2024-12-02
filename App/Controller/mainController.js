import mainDatamapper from '../Model/datamapper.js'

const mainController = {

    home: async (req, res) => {
        try {
            const properties = await mainDatamapper.allProperties();
            console.log(properties);
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
    }

 };
 

export default mainController;