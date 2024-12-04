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
DROP TABLE IF EXISTS VISITE;
DROP TABLE IF EXISTS TYPE_PROPRIETE;
DROP TABLE IF EXISTS ADMINISTRATEUR;
DROP TABLE IF EXISTS PERSONNE;
DROP TABLE IF EXISTS RENDEZVOUS;

SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE RENDEZVOUS(
   ID_RendezVous  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   Date_RendezVous DATE,
   Heure_RendezVous TIME,
   Lieu VARCHAR(50),
   Statut_RendezVous VARCHAR(50),
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
);

CREATE TABLE PERSONNE(
   ID_Personne INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
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
   ID_ADMINISTRATEUR INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   ID_Personne INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_ADMINISTRATEUR),
   UNIQUE(ID_Personne),
   FOREIGN KEY(ID_Personne) REFERENCES PERSONNE(ID_Personne)
);

CREATE TABLE TYPE_PROPRIETE(
   ID_TypePropriete INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   Libelle VARCHAR(50),
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_TypePropriete)
);

CREATE TABLE VISITE(
   ID_Visite INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   Date_Visite DATE,
   Heure_Visite TIME,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Visite)
);



CREATE TABLE Statut(
   ID_Statut INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   Libelle VARCHAR(50),
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY(ID_Statut)
);

CREATE TABLE TYPE_CLIENT(
   ID_TypeClient INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   Libelle VARCHAR(50),
   Anciennete VARCHAR(50) NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   
);

CREATE TABLE PLATEFORME(
   ID_Plateforme INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   Type_Interaction VARCHAR(50),
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 
);

CREATE TABLE MESSAGERIE(
   ID_Messagerie INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   Texte_Message VARCHAR(500),
   Date_Message DATE,
   Heure_Message TIME,
   Statut VARCHAR(50),
   ID_Plateforme INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   FOREIGN KEY(ID_Plateforme) REFERENCES PLATEFORME(ID_Plateforme)
);

CREATE TABLE NOTIF(
   ID_NOTIF INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   Type_NOTIF VARCHAR(50),
   Date_NOTIF DATE,
   Heure_NOTIF VARCHAR(50),
   Contenu_NOTIF VARCHAR(200),
   ID_Plateforme INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   FOREIGN KEY(ID_Plateforme) REFERENCES PLATEFORME(ID_Plateforme)
);

CREATE TABLE GESTION(
   ID_Gestion INT  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   ID_ADMINISTRATEUR INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   FOREIGN KEY(ID_ADMINISTRATEUR) REFERENCES ADMINISTRATEUR(ID_ADMINISTRATEUR)
);

CREATE TABLE CONTRAT(
   ID_Contrat  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   Type_Contrat VARCHAR(50),
   Signature_Contrat VARCHAR(50),
   Date_Contrat DATE,
   ID_Gestion INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   FOREIGN KEY(ID_Gestion) REFERENCES GESTION(ID_Gestion)
);

CREATE TABLE PAIEMENT(
   ID_Paiement INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   Suivi_Paiement VARCHAR(50),
   Type_Paiement VARCHAR(50),
   ID_Gestion INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   FOREIGN KEY(ID_Gestion) REFERENCES GESTION(ID_Gestion)
);

CREATE TABLE DOCUMENT(
   ID_Document INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,,
   Type_Document VARCHAR(50),
   Info_Document VARCHAR(50),
   Date_Ajout DATE,
   taille_docu INT,
   ID_Gestion INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   FOREIGN KEY(ID_Gestion) REFERENCES GESTION(ID_Gestion)
);

CREATE TABLE PLATEFORME_CENTRALE(
   ID_Plateforme INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   Nom_Appli VARCHAR(50),
   Logo_Appli VARCHAR(50),
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   
);

CREATE TABLE Avis_Client(
   ID_Avis INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,,
   Note INT,
   Commentaire VARCHAR(200),
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   
);

CREATE TABLE AGENT(
   ID_Agent INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   licence VARCHAR(50),
   Specialisation VARCHAR(50),
   Experience INT,
   Performance VARCHAR(200),
   Photo_profil VARCHAR(50),
   ID_Plateforme INT NOT NULL,
   ID_Personne INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   UNIQUE(ID_Personne),
   FOREIGN KEY(ID_Plateforme) REFERENCES PLATEFORME(ID_Plateforme),
   FOREIGN KEY(ID_Personne) REFERENCES PERSONNE(ID_Personne)
);

CREATE TABLE AGENCE(
   ID_Agence INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,,
   Nom_Agence VARCHAR(50),
   ID_Plateforme INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   FOREIGN KEY(ID_Plateforme) REFERENCES PLATEFORME_CENTRALE(ID_Plateforme)
);

CREATE TABLE TRANSAC(
   ID_TRANSAC INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,,
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
   ID_Propriete INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   Nom VARCHAR(50),
   Prix_Propriete DECIMAL(15, 2),
   Dimension DECIMAL(10, 2),
   Date_Ajout DATE,
   Description_Propriete VARCHAR(255),
   Piscine BOOLEAN,         
   Meuble BOOLEAN,         
   Jardin BOOLEAN,          
   Nombre_Piece INT,
   statut  VARCHAR(50),
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

);

CREATE TABLE Media(
   ID_Media INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   Type_Media VARCHAR(50),
   Titre VARCHAR(50),
   DateAjout DATE,
   ID_Propriete INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
);

CREATE TABLE CLIENT(
   ID_Client INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   Revenu_annuel VARCHAR(50),
   Langue_preferee VARCHAR(50),
   ID_Visite INT,
   ID_RendezVous INT,
   ID_TRANSAC INT NOT NULL,
   ID_Personne INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   UNIQUE(ID_Personne),
   FOREIGN KEY(ID_Visite) REFERENCES VISITE(ID_Visite),
   FOREIGN KEY(ID_RendezVous) REFERENCES RENDEZVOUS(ID_RendezVous),
   FOREIGN KEY(ID_TRANSAC) REFERENCES TRANSAC(ID_TRANSAC),
   FOREIGN KEY(ID_Personne) REFERENCES PERSONNE(ID_Personne)
);

CREATE TABLE DOCUMENT_CLIENT(
   ID_Document INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   Libelle_Document VARCHAR(50),
   Nom_Document DATE,
   Date_Upload DATE,
   Statut VARCHAR(50),
   ID_Client INT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   FOREIGN KEY(ID_Client) REFERENCES CLIENT(ID_Client)
);

CREATE TABLE PROPOSER(
   ID_Agent INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   ID_Visite INT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   FOREIGN KEY(ID_Agent) REFERENCES AGENT(ID_Agent),
   FOREIGN KEY(ID_Visite) REFERENCES VISITE(ID_Visite)
);

CREATE TABLE CARACTERISER(
   ID_Client INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   ID_TypeClient INT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   FOREIGN KEY(ID_Client) REFERENCES CLIENT(ID_Client),
   FOREIGN KEY(ID_TypeClient) REFERENCES TYPE_CLIENT(ID_TypeClient)
);

CREATE TABLE LAISSER(
   ID_Client INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   ID_Avis INT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   FOREIGN KEY(ID_Client) REFERENCES CLIENT(ID_Client),
   FOREIGN KEY(ID_Avis) REFERENCES Avis_Client(ID_Avis)
);

CREATE TABLE LIER(
   ID_Personne INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   ID_Agence INT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   FOREIGN KEY(ID_Personne) REFERENCES PERSONNE(ID_Personne),
   FOREIGN KEY(ID_Agence) REFERENCES AGENCE(ID_Agence)
);

CREATE TABLE APPARTENIR(
   ID_Propriete INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   ID_TypePropriete INT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   FOREIGN KEY(ID_Propriete) REFERENCES PROPRIETE(ID_Propriete),
   FOREIGN KEY(ID_TypePropriete) REFERENCES TYPE_PROPRIETE(ID_TypePropriete)
);

CREATE TABLE AFFICHER(
   ID_Propriete INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   ID_Plateforme INT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   FOREIGN KEY(ID_Propriete) REFERENCES PROPRIETE(ID_Propriete),
   FOREIGN KEY(ID_Plateforme) REFERENCES PLATEFORME(ID_Plateforme)
);

CREATE TABLE INTERAGIR(
   ID_Client INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   ID_Plateforme INT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
   FOREIGN KEY(ID_Client) REFERENCES CLIENT(ID_Client),
   FOREIGN KEY(ID_Plateforme) REFERENCES PLATEFORME(ID_Plateforme)
);

COMMIT;