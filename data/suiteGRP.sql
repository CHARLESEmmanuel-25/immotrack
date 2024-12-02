BEGIN;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS INTERAGIR;
DROP TABLE IF EXISTS AFFICHER;
DROP TABLE IF EXISTS APPARTENIR;
DROP TABLE IF EXISTS LIER;
DROP TABLE IF EXISTS LAISSER;
DROP TABLE IF EXISTS CARACTERISER;
DROP TABLE IF EXISTS PROPOSER;
DROP TABLE IF EXISTS DOCUMENT_CLIENT;
DROP TABLE IF EXISTS CLIENT;
DROP TABLE IF EXISTS Media;
DROP TABLE IF EXISTS PROPRIETE;
DROP TABLE IF EXISTS TRANSAC;
DROP TABLE IF EXISTS AGENCE;
DROP TABLE IF EXISTS AGENT;
DROP TABLE IF EXISTS Avis_Client;
DROP TABLE IF EXISTS PLATEFORME_CENTRALE;
DROP TABLE IF EXISTS DOCUMENT;
DROP TABLE IF EXISTS PAIEMENT;
DROP TABLE IF EXISTS CONTRAT;
DROP TABLE IF EXISTS GESTION;
DROP TABLE IF EXISTS NOTIF;
DROP TABLE IF EXISTS MESSAGERIE;
DROP TABLE IF EXISTS PLATEFORME;
DROP TABLE IF EXISTS TYPE_CLIENT;
DROP TABLE IF EXISTS Statut;
DROP TABLE IF EXISTS Localisation;
DROP TABLE IF EXISTS VISITE;
DROP TABLE IF EXISTS TYPE_PROPRIETE;
DROP TABLE IF EXISTS ADMINISTRATEUR;
DROP TABLE IF EXISTS PERSONNE;
DROP TABLE IF EXISTS RENDEZVOUS;

SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE RENDEZVOUS(
   ID_RendezVous INT,
   Date_RendezVous DATE,
   Heure_RendezVous TIME,
   Lieu VARCHAR(50),
   Statut_RendezVous VARCHAR(50),
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_RendezVous)
);

CREATE TABLE PERSONNE(
   ID_Personne INT,
   Nom VARCHAR(50),
   Email VARCHAR(50),
   Prénom VARCHAR(50),
   Téléphone INT,
   Adresse VARCHAR(50),
   Date_inscription DATE,
   Date_de_naissance DATE,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Personne)
);

CREATE TABLE ADMINISTRATEUR(
   ID_ADMINISTRATEUR INT,
   ID_Personne INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_ADMINISTRATEUR),
   UNIQUE(ID_Personne),
   FOREIGN KEY(ID_Personne) REFERENCES PERSONNE(ID_Personne)
);

CREATE TABLE TYPE_PROPRIETE(
   ID_TypePropriete INT,
   Libelle VARCHAR(50),
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_TypePropriete)
);

CREATE TABLE VISITE(
   ID_Visite INT,
   Date_Visite DATE,
   Heure_Visite TIME,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Visite)
);

CREATE TABLE Localisation(
   ID_Localisation INT,
   Ville VARCHAR(50),
   Adresse VARCHAR(50),
   CodePostal INT,
   Region VARCHAR(50),
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Localisation)
);

CREATE TABLE Statut(
   ID_Statut INT,
   Libelle VARCHAR(50),
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Statut)
);

CREATE TABLE TYPE_CLIENT(
   ID_TypeClient INT,
   Libelle VARCHAR(50),
   Anciennete VARCHAR(50) NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_TypeClient)
);

CREATE TABLE PLATEFORME(
   ID_Plateforme INT,
   Type_Interaction VARCHAR(50),
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Plateforme)
);

CREATE TABLE MESSAGERIE(
   ID_Messagerie INT,
   Texte_Message VARCHAR(500),
   Date_Message DATE,
   Heure_Message TIME,
   Statut VARCHAR(50),
   ID_Plateforme INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Messagerie),
   FOREIGN KEY(ID_Plateforme) REFERENCES PLATEFORME(ID_Plateforme)
);

CREATE TABLE NOTIF(
   ID_NOTIF INT,
   Type_NOTIF VARCHAR(50),
   Date_NOTIF DATE,
   Heure_NOTIF VARCHAR(50),
   Contenu_NOTIF VARCHAR(200),
   ID_Plateforme INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_NOTIF),
   FOREIGN KEY(ID_Plateforme) REFERENCES PLATEFORME(ID_Plateforme)
);

CREATE TABLE GESTION(
   ID_Gestion INT,
   ID_ADMINISTRATEUR INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Gestion),
   FOREIGN KEY(ID_ADMINISTRATEUR) REFERENCES ADMINISTRATEUR(ID_ADMINISTRATEUR)
);

CREATE TABLE CONTRAT(
   ID_Contrat INT,
   Type_Contrat VARCHAR(50),
   Signature_Contrat VARCHAR(50),
   Date_Contrat DATE,
   ID_Gestion INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Contrat),
   FOREIGN KEY(ID_Gestion) REFERENCES GESTION(ID_Gestion)
);

CREATE TABLE PAIEMENT(
   ID_Paiement INT,
   Suivi_Paiement VARCHAR(50),
   Type_Paiement VARCHAR(50),
   ID_Gestion INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Paiement),
   FOREIGN KEY(ID_Gestion) REFERENCES GESTION(ID_Gestion)
);

CREATE TABLE DOCUMENT(
   ID_Document INT,
   Type_Document VARCHAR(50),
   Info_Document VARCHAR(50),
   Date_Ajout DATE,
   taille_docu INT,
   ID_Gestion INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Document),
   FOREIGN KEY(ID_Gestion) REFERENCES GESTION(ID_Gestion)
);

CREATE TABLE PLATEFORME_CENTRALE(
   ID_Plateforme INT,
   Nom_Appli VARCHAR(50),
   Logo_Appli VARCHAR(50),
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Plateforme)
);

CREATE TABLE Avis_Client(
   ID_Avis INT,
   Note INT,
   Commentaire VARCHAR(200),
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Avis)
);

CREATE TABLE AGENT(
   ID_Agent INT,
   licence VARCHAR(50),
   Specialisation VARCHAR(50),
   Experience INT,
   Performance VARCHAR(200),
   Photo_profil VARCHAR(50),
   ID_Plateforme INT NOT NULL,
   ID_Personne INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Agent),
   UNIQUE(ID_Personne),
   FOREIGN KEY(ID_Plateforme) REFERENCES PLATEFORME(ID_Plateforme),
   FOREIGN KEY(ID_Personne) REFERENCES PERSONNE(ID_Personne)
);

CREATE TABLE AGENCE(
   ID_Agence INT,
   Nom_Agence VARCHAR(50),
   ID_Plateforme INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Agence),
   FOREIGN KEY(ID_Plateforme) REFERENCES PLATEFORME_CENTRALE(ID_Plateforme)
);

CREATE TABLE TRANSAC(
   ID_TRANSAC INT,
   type DATE,
   montant TIME,
   mode_paiement VARCHAR(50),
   date_achat DATE,
   ID_Agent INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_TRANSAC),
   FOREIGN KEY(ID_Agent) REFERENCES AGENT(ID_Agent)
);

CREATE TABLE PROPRIETE (
   ID_Propriete INT PRIMARY KEY,
   Nom VARCHAR(50),
   Prix_Propriete DECIMAL(15, 2),
   Dimension DECIMAL(10, 2),
   Date_Ajout DATE,
   Description_Propriete VARCHAR(255),
   Piscine BOOLEAN,         
   Meuble BOOLEAN,         
   Jardin BOOLEAN,          
   Nombre_Piece INT,
   ID_Statut INT NOT NULL,
   ID_Localisation INT NOT NULL,
   ID_TRANSAC INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   FOREIGN KEY (ID_Statut) REFERENCES Statut(ID_Statut),
   FOREIGN KEY (ID_Localisation) REFERENCES Localisation(ID_Localisation),
   FOREIGN KEY (ID_TRANSAC) REFERENCES TRANSAC(ID_TRANSAC)
);

CREATE TABLE Media(
   ID_Media INT,
   Type_Media VARCHAR(50),
   Titre VARCHAR(50),
   DateAjout DATE,
   ID_Propriete INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Media),
   FOREIGN KEY(ID_Propriete) REFERENCES PROPRIETE(ID_Propriete)
);

CREATE TABLE CLIENT(
   ID_Client INT,
   Revenu_annuel VARCHAR(50),
   Langue_preferee VARCHAR(50),
   ID_Visite INT,
   ID_RendezVous INT,
   ID_TRANSAC INT NOT NULL,
   ID_Personne INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Client),
   UNIQUE(ID_Personne),
   FOREIGN KEY(ID_Visite) REFERENCES VISITE(ID_Visite),
   FOREIGN KEY(ID_RendezVous) REFERENCES RENDEZVOUS(ID_RendezVous),
   FOREIGN KEY(ID_TRANSAC) REFERENCES TRANSAC(ID_TRANSAC),
   FOREIGN KEY(ID_Personne) REFERENCES PERSONNE(ID_Personne)
);

CREATE TABLE DOCUMENT_CLIENT(
   ID_Document INT,
   Libelle_Document VARCHAR(50),
   Nom_Document DATE,
   Date_Upload DATE,
   Statut VARCHAR(50),
   ID_Client INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Document),
   FOREIGN KEY(ID_Client) REFERENCES CLIENT(ID_Client)
);

CREATE TABLE PROPOSER(
   ID_Agent INT,
   ID_Visite INT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Agent, ID_Visite),
   FOREIGN KEY(ID_Agent) REFERENCES AGENT(ID_Agent),
   FOREIGN KEY(ID_Visite) REFERENCES VISITE(ID_Visite)
);

CREATE TABLE CARACTERISER(
   ID_Client INT,
   ID_TypeClient INT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Client, ID_TypeClient),
   FOREIGN KEY(ID_Client) REFERENCES CLIENT(ID_Client),
   FOREIGN KEY(ID_TypeClient) REFERENCES TYPE_CLIENT(ID_TypeClient)
);

CREATE TABLE LAISSER(
   ID_Client INT,
   ID_Avis INT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Client, ID_Avis),
   FOREIGN KEY(ID_Client) REFERENCES CLIENT(ID_Client),
   FOREIGN KEY(ID_Avis) REFERENCES Avis_Client(ID_Avis)
);

CREATE TABLE LIER(
   ID_Personne INT,
   ID_Agence INT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Personne, ID_Agence),
   FOREIGN KEY(ID_Personne) REFERENCES PERSONNE(ID_Personne),
   FOREIGN KEY(ID_Agence) REFERENCES AGENCE(ID_Agence)
);

CREATE TABLE APPARTENIR(
   ID_Propriete INT,
   ID_TypePropriete INT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Propriete, ID_TypePropriete),
   FOREIGN KEY(ID_Propriete) REFERENCES PROPRIETE(ID_Propriete),
   FOREIGN KEY(ID_TypePropriete) REFERENCES TYPE_PROPRIETE(ID_TypePropriete)
);

CREATE TABLE AFFICHER(
   ID_Propriete INT,
   ID_Plateforme INT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Propriete, ID_Plateforme),
   FOREIGN KEY(ID_Propriete) REFERENCES PROPRIETE(ID_Propriete),
   FOREIGN KEY(ID_Plateforme) REFERENCES PLATEFORME(ID_Plateforme)
);

CREATE TABLE INTERAGIR(
   ID_Client INT,
   ID_Plateforme INT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Client, ID_Plateforme),
   FOREIGN KEY(ID_Client) REFERENCES CLIENT(ID_Client),
   FOREIGN KEY(ID_Plateforme) REFERENCES PLATEFORME(ID_Plateforme)
);

COMMIT;
