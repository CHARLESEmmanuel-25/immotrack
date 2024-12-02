
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
