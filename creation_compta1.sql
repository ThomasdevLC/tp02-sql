CREATE TABLE fournisseur
(
    id  INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL
);

CREATE TABLE article
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    ref         VARCHAR(50) NOT NULL,
    designation TEXT NOT NULL,
    prix        DECIMAL(8, 2),
    fournisseur_id INT NOT NULL,
    FOREIGN KEY (fournisseur_id) REFERENCES fournisseur(id)
);

CREATE TABLE bon
(
    id     INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(100) NOT NULL,
    date   DATE     NOT NULL,
    delai  int          NOT NULL,
    id_fou INT NOT NULL,
    FOREIGN KEY (id_fou) REFERENCES fournisseur(id)
);


CREATE TABLE compo
(
    id  INT PRIMARY KEY AUTO_INCREMENT,
    qte int NOT NULL,
    id_art INT NOT NULL,
    id_bon INT NOT NULL,
    FOREIGN KEY (id_art) REFERENCES article(id),
    FOREIGN KEY (id_bon) REFERENCES bon(id)

);

INSERT INTO fournisseur ( nom)
VALUES
    ('Française d’Imports'),
    ('FDM SA'),
    ('Dubois & Fils');


INSERT INTO article ( ref, designation,prix, fournisseur_id)
VALUES

( 'A01', 'Perceuse P1', 74.99, 1 ),
( 'F01', 'Boulon laiton 4 x 40 mm (sachet de 10)', 2.25, 2 ),
( 'F02', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.45, 2 ),
( 'D01', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.40, 3 ),
( 'A02', 'Meuleuse 125mm', 37.85, 1 ),
( 'D03', 'Boulon acier zingué 4 x 40mm (sachet de 10)', 1.80, 3 ),
( 'A03', 'Perceuse à colonne', 185.25, 1 ),
( 'D04', 'Coffret mêches à bois', 12.25, 3 ),
( 'F03', 'Coffret mêches plates', 6.25, 2 ),
( 'F04', 'Fraises d''encastrement', 8.14, 2 );




INSERT INTO bon ( numero , date, delai , id_fou)
VALUES
    ('bon-188' ,'2025/12/10',3,1);


INSERT INTO compo ( qte, id_art, id_bon)
VALUES
    (3, 1, 1),
    (4, 5, 1),
    (1, 7, 1);











