INSERT INTO PLATEFORME (ID_Plateforme, Type_Interaction)
VALUES 
(1, 'Site Web'),
(2, 'Application Mobile'),
(3, 'Agence Physique'),
(4, 'Partenaire Externe'),
(5, 'Réseaux Sociaux');

INSERT INTO PERSONNE (ID_Personne, Nom, Email, Prénom, Téléphone, Adresse, Date_inscription, Date_de_naissance)
VALUES 
(1001, 'Dupont', 'dupont.julien@example.com', 'Julien', 612345678, '12 Rue des Fleurs', '2023-01-15', '1985-05-10'),
(1002, 'Martin', 'martin.sophie@example.com', 'Sophie', 634567890, '45 Avenue des Champs', '2023-02-20', '1990-07-18'),
(1003, 'Bernard', 'bernard.pierre@example.com', 'Pierre', 645678901, '8 Boulevard Saint-Michel', '2023-03-10', '1982-09-12'),
(1004, 'Petit', 'petit.emilie@example.com', 'Émilie', 656789012, '78 Rue Lafayette', '2023-04-25', '1995-11-30'),
(1005, 'Durand', 'durand.marie@example.com', 'Marie', 667890123, '23 Rue Victor Hugo', '2023-05-05', '1988-01-22'),
(1006, 'Lemoine', 'lemoine.alex@example.com', 'Alex', 678901234, '56 Quai des Chartrons', '2023-06-15', '1993-03-14'),
(1007, 'Moreau', 'moreau.claire@example.com', 'Claire', 689012345, '34 Place Bellecour', '2023-07-10', '1987-08-08');

INSERT INTO AGENT (ID_Agent, licence, Specialisation, Experience, Performance, Photo_profil, ID_Plateforme, ID_Personne)
VALUES 
(101, 'LIC20231234', 'Immobilier Résidentiel', 5, 'Excellent service client, taux de satisfaction de 95%', 'agent101.jpg', 1, 1001),
(102, 'LIC20231235', 'Immobilier Commercial', 8, 'Expert en négociations commerciales, reconnu pour sa rapidité.', 'agent102.jpg', 1, 1002),
(103, 'LIC20231236', 'Locations Saisonnières', 3, 'Capacité à maximiser les revenus locatifs.', 'agent103.jpg', 2, 1003),
(104, 'LIC20231237', 'Investissements Immobiliers', 10, 'Connaissance approfondie des marchés financiers.', 'agent104.jpg', 2, 1004),
(105, 'LIC20231238', 'Immobilier Luxe', 7, 'Portefeuille exclusif de clients haut de gamme.', 'agent105.jpg', 3, 1005),
(106, 'LIC20231239', 'Conseil en Rénovation', 4, 'Spécialiste des biens à rénover et à revendre.', 'agent106.jpg', 3, 1006),
(107, 'LIC20231240', 'Gestion Locative', 6, 'Réduction des taux d’inoccupation à moins de 2%.', 'agent107.jpg', 4, 1007);

INSERT INTO TRANSAC (ID_TRANSAC, type, montant, mode_paiement, date_achat, ID_Agent)
VALUES 
(1, '2024-01-15', '15:30:00', 'Carte Bancaire', '2024-01-15', 101),
(2, '2024-02-01', '10:45:00', 'Virement Bancaire', '2024-02-01', 102),
(3, '2024-03-20', '14:00:00', 'Espèces', '2024-03-20', 103),
(4, '2024-04-10', '16:15:00', 'Chèque', '2024-04-10', 104),
(5, '2024-05-05', '09:30:00', 'Carte Bancaire', '2024-05-05', 105),
(6, '2024-06-18', '11:00:00', 'Virement Bancaire', '2024-06-18', 106),
(7, '2024-07-22', '13:30:00', 'Espèces', '2024-07-22', 107);

INSERT INTO Localisation (ID_Localisation, Ville, Adresse, CodePostal, Region)
VALUES 
(1, 'Paris', '123 Rue Lafayette', 75010, 'Île-de-France'),
(2, 'Versailles', '10 Avenue de Paris', 78000, 'Île-de-France'),
(3, 'Boulogne-Billancourt', '25 Rue Gallieni', 92100, 'Île-de-France'),
(4, 'Saint-Denis', '45 Place Jean Jaurès', 93200, 'Île-de-France'),
(5, 'Nanterre', '78 Boulevard des Provinces Françaises', 92000, 'Île-de-France'),
(6, 'Créteil', '15 Rue de Paris', 94000, 'Île-de-France'),
(7, 'Cergy', '3 Place de la Préfecture', 95000, 'Île-de-France'),
(8, 'Montreuil', '66 Rue de Vincennes', 93100, 'Île-de-France');

INSERT INTO Statut (ID_Statut, Libelle)
VALUES 
(1, 'Disponible'),
(2, 'Sous Offre'),
(3, 'Vendu'),
(4, 'Loué'),
(5, 'Réservé'),
(6, 'En Construction');

INSERT INTO PROPRIETE (ID_Propriete, Nom, Prix_Propriete, Dimension, Date_Ajout, Description_Propriete, poster,Piscine, Meuble, Jardin, Nombre_Piece, ID_Statut, ID_Localisation, ID_TRANSAC)
VALUES 
(1, 'Villa Moderne', 450000.00, 250.50, '2023-05-15', 'Magnifique villa moderne avec piscine et jardin.','villa.png', TRUE, TRUE, TRUE, 5, 1, 1, 2),
(2, 'Appartement Luxe', 350000.00, 120.00, '2023-06-10', 'Appartement de luxe entièrement meublé avec vue sur la mer.','villa.png', FALSE, TRUE, FALSE, 3, 1, 2, 1),
(3, 'Maison de Campagne', 250000.00, 200.00, '2023-07-01', 'Charmante maison de campagne avec grand jardin.','villa.png', FALSE, FALSE, TRUE, 4, 2, 3, 2),
(4, 'Studio Urbain', 150000.00, 45.00, '2023-08-20', 'Studio idéalement situé en centre-ville, parfait pour un étudiant.','villa.png', FALSE, TRUE, FALSE, 1, 1, 2, 1),
(5, 'Château Historique', 1250000.00, 1500.00, '2023-09-15', 'Château historique avec vastes terrains et architecture classique.','villa.png', TRUE, FALSE, TRUE, 20, 3, 4, 3),
(6, 'Loft Industriel', 550000.00, 300.00, '2023-10-05', 'Loft de style industriel avec vue panoramique.','villa.png', FALSE, TRUE, FALSE, 4, 1, 5, 2),
(7, 'Maison Écologique', 400000.00, 180.00, '2023-11-11', 'Maison écologique avec panneaux solaires et jardin durable.','villa.png', FALSE, TRUE, TRUE, 6, 2, 6, 1),
(8, 'Penthouse Exclusif', 950000.00, 400.00, '2023-12-01', 'Penthouse de prestige avec accès privé et jacuzzi.','villa.png', TRUE, TRUE, TRUE, 7, 1, 7, 3);


