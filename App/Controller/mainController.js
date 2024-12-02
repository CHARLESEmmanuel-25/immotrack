

const mainController = {

    home : async (req,res)=>{
        res.render('index');
    },

    addProp: async (req,res)=>{
        res.render('add');
    },

    editProp : async(req,res)=>{
        res.render('edit');
    }

 };
 

export default mainController;