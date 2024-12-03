


// SEARCH BAR 
 // Cibler la barre 
 const searchInput = document.querySelector('.search-input');

 const contenairCardHome =document.querySelectorAll('.card-home');

        // Ajouter l'écouteur d'événement 'input'
searchInput.addEventListener('input', async (e) => {
    const url = "http://localhost:3000/search";
    let recherche = e.target.value;
    if (recherche.length > 0) {
        contenairCardHome.forEach(card =>{
            card.classList.add('hidden');
        })
    }else{
        contenairCardHome.forEach(card =>{
            card.classList.remove('hidden');
        })
    }
    console.log(recherche);

    try {
        const res = await fetch(url, {
            method: 'POST', 
            headers: {
                'Content-Type': 'application/json' 
            },
            body: JSON.stringify({ query: recherche }) 
        });

        if (!res.ok) {
            throw new Error(`Erreur lors de la requête : ${res.status}`);
        }

        const json = await res.json(res); 
        console.log('Réponse JSON:', json); 
    } catch (error) {
        console.error('Erreur:', error.message); 
    }
});








// PAGE DELETE 

// je recupère le bien cliqué
const cardDelete = document.querySelector('.is-clicked');
// je recupere la modal de suppression
const deleteModale = document.querySelector('.delete-case');

cardDelete.addEventListener('click', (e)=>{
    e.preventDefault();
    deleteModale.classList.remove('hidden');
})

// je recupere le bouton close pour fermer la modale

const closeModale = document.querySelector('.close');

closeModale.addEventListener('click', ()=>{
    deleteModale.classList.add('hidden');
})





// PAGINATION PHOTOS
const listeImage = document.querySelectorAll('.gallery-item');
const btnNext = document.querySelector('.next');
const btnPrev = document.querySelector('.prev');
const dotsContainer = document.querySelector('.pagination');

let currentIndex = 0;


function afficherImage(index) {
    listeImage.forEach((image, i) => {
        image.style.display = i === index ? 'block' : 'none';
    });

   
    const dots = document.querySelectorAll('.dot');
    dots.forEach((dot, i) => {
        dot.classList.toggle('active', i === index);
    });
}

// Fonction pour créer les dots
function createDots() {
    if (lengthListe > 0) {
        for (let index = 0; index < lengthListe; index++) {
            const dot = document.createElement('div');
            dot.classList.add('dot');
            if (index === 0) dot.classList.add('active'); 
            dotsContainer.appendChild(dot);

            
            dot.addEventListener('click', () => {
                currentIndex = index;
                afficherImage(currentIndex);
            });
        }
    }
}


const lengthListe = listeImage.length;

// Gestion des boutons "Suivant" et "Précédent"
btnNext.addEventListener('click', () => {
    currentIndex = (currentIndex + 1) % lengthListe;
    afficherImage(currentIndex);
});

btnPrev.addEventListener('click', () => {
    currentIndex = (currentIndex - 1 + lengthListe) % lengthListe;
    afficherImage(currentIndex);
});

// Initialisation
createDots();
afficherImage(currentIndex);


