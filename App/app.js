import express from 'express';
import path from 'path';
import router from './Router/router.js';
import session from 'express-session';
import dotenv from 'dotenv';
import cors from 'cors';


const app = express();



// Configuration du moteur de vues EJS
app.set('view engine', 'ejs');
app.set('views', path.join(process.cwd(), 'views'));

// Middleware pour les fichiers statiques
app.use(express.static(path.join(process.cwd(), 'public')));

// body parser

app.use(express.json()); 

// CORS handler
app.use(
    cors({
      origin: 'http://localhost:3000',
      credentials: true,
    })
  );


// Utilisation du router
app.use(router);

export default app;