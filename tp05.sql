-- a. Mettez en minuscules la désignation de l’article dont l’identifiant est 2
UPDATE article
SET article.designation = LOWER(DESIGNATION)
WHERE article.id = 2;

-- b. Mettez en majuscules les désignations de tous les articles dont le prix est strictement supérieur à 10€
UPDATE article
SET article.designation = UPPER(DESIGNATION)
WHERE article.prix > 10;


-- c.Ajouter un nouvel article /  Baissez de 10% le prix de tous les articles qui n’ont pas fait l’objet d’une commande.
INSERT INTO article (ref, designation, prix, fournisseur_id)
VALUES
    ('G01', 'Tournevis', 12.50, 2);

UPDATE article
SET article.prix = article.prix * 0.9
WHERE NOT EXISTS (
    SELECT *
    FROM compo
    WHERE compo.id_art = article.id
);


-- d. Une erreur s’est glissée dans les commandes concernant Française d’imports. Les
-- chiffres en base ne sont pas bons. Il faut doubler les quantités de tous les articles
-- commandés à cette société.
UPDATE compo
    JOIN bon ON bon.id = compo.id_bon
    JOIN article ON article.id = compo.id_art
    JOIN  fournisseur ON article.fournisseur_id = fournisseur.id
SET compo.qte = compo.qte * 2
WHERE fournisseur.nom =  'Française d’imports';

