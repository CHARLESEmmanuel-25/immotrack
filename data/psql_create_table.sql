BEGIN;

-- Suppression de la table si elle existe déjà
DROP TABLE IF EXISTS propriete CASCADE;

-- Création de la table propriete
CREATE TABLE propriete (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  Nom TEXT,
  Prix_Propriete NUMERIC NOT NULL,
  Dimension INT NOT NULL,
  Description_Propriete TEXT NOT NULL,
  Piscine BOOLEAN,
  Meuble BOOLEAN,
  Jardin BOOLEAN,
  poster TEXT NOT NULL,
  Ville TEXT NOT NULL,
  Adresse TEXT NOT NULL,
  CodePostal VARCHAR(10) NOT NULL,  -- Utilisation de VARCHAR pour les codes postaux
  Region TEXT,
  statut TEXT,
  Nombre_Piece INT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);



COMMIT;
