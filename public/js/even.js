

// SEARCH BAR 
// Cibler la barre 
const searchInput = document.querySelector('.search-input');
const gridContenair = document.querySelector('.grid-home');
const contenairCardHome = document.querySelectorAll('.card-home');


let debounceTimeout;

// Fonction debounce pour limiter les appels API
const debounce = (func, delay) => {
    return (...args) => {
        clearTimeout(debounceTimeout);
        debounceTimeout = setTimeout(() => func(...args), delay);
    };
};

searchInput.addEventListener(
    'input',
    debounce(async (e) => {
      const recherche = e.target.value.trim(); // Supprime les espaces inutiles
  
      // Si l'entrée est vide, on cache tout
      if (recherche === '') {
        
        contenairCardHome.forEach((card) => card.classList.remove('hidden')); // Cache les cartes par défaut
        return; // Arrête l'exécution ici
      }
  
      // Ne lancez la requête que si l'utilisateur a tapé au moins 3 caractères
      if (recherche.length < 3) {
        return; // On arrête ici pour éviter des requêtes inutiles
      }
  
      try {
        // Ajouter la recherche comme paramètre dans l'URL
        const url = `http://localhost:3000/search/${recherche}`;
  
        const res = await fetch(url, {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json',
          },
        });
  
        if (!res.ok) {
          throw new Error(`Erreur lors de la requête : ${res.status}`);
        }
  
        // Récupérer la réponse JSON
        const { rechercheProp } = await res.json();
  
        // Vider tout contenu précédent avant d'ajouter les nouveaux résultats
        gridContenair.innerHTML = '';
  
        const search = document.createElement('div');
        search.classList.add('grid-search');

        console.log(rechercheProp);
  
        // Ajouter les cartes de résultats
        for (const [key, value] of Object.entries(rechercheProp)) {
          search.innerHTML += `
            <div class="card-search">
              <small class="tag is-size-7 is-warning status"><p>FOR RENT</p></small>
              <small class="favori has-text-danger"><i class="fas fa-heart"></i></small>
              <img src="/assets/exemple.jpg" alt="" srcset="">
              <div class="infocard-home">
                <p class="is-size-7">${value.Nom}</p>
                <p class="prix-prop is-size-7"><strong>$ ${value.Prix_Propriete}</strong></p>
                <p class="is-size-7 localisation"><i class="fas fa-map-marker-alt icon-location"></i>2 rue de la villa, Marseille</p>
                <div class="tag-localisation">
                  <span class="icon-text">
                    <span class="icon is-size-7">
                      <i class="fas fa-bed attribut"></i>
                    </span>
                    <p class="attribut-icon">7 chambres</p>
                  </span>
                  <span class="icon-text">
                    <span class="icon is-size-7">
                      <i class="fas fa-bath attribut"></i>
                    </span>
                    <p class="attribut-icon">3 bath</p>
                  </span>
                  <span class="icon-text">
                    <span class="icon is-size-7">
                      <i class="fas fa-ruler attribut"></i>
                    </span>
                    <p class="attribut-icon">150 m²</p>
                  </span>
                </div>
              </div>
            </div>
          `;
        }
  
        // Ajouter les résultats au conteneur principal
        gridContenair.appendChild(search);
      } catch (error) {
        console.error(`Erreur : ${error.message}`);
      }
    }, 500) // Délai de 500ms
  );
  
  













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


