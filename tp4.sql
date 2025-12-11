-- a. Listez les articles dans l’ordre alphabétique des désignations
SELECT * FROM article ORDER BY designation;

-- b  Listez les articles dans l’ordre des prix du plus élevé au moins élevé
SELECT * FROM article ORDER BY prix DESC;

-- c Listez tous les articles qui sont des « boulons » et triez les résultats par ordre de prixascendant
SELECT * FROM article WHERE designation LIKE '%boulon%' ORDER BY prix ASC;


-- d Listez tous les articles dont la désignation contient le mot « sachet »
SELECT * FROM article WHERE designation LIKE '%sachet%';

-- e  Listez tous les articles dont la désignation contient le mot « sachet » indépendamment de la casse !

SELECT * FROM article WHERE designation COLLATE utf8mb4_general_ci LIKE '%sachet%';


-- f Listez les articles avec les informations fournisseur correspondantes.
-- Les résultats doivent être triées dans l’ordre alphabétique des fournisseurs et par article du prix le plus élevé au moins élevé
SELECT *
FROM article
JOIN fournisseur ON article.fournisseur_id = fournisseur.id
ORDER BY fournisseur.nom AND article.prix ASC ;

-- g Listez les articles de la société « Dubois & Fils »
SELECT *
FROM article
         JOIN fournisseur ON article.fournisseur_id = fournisseur.id
WHERE fournisseur.nom LIKE  '%Dubois & Fils%';


-- h. Calculez la moyenne des prix des articles de la société « Dubois & Fils »
SELECT AVG(article.prix) AS 'prix_moyen_articles_Dubois_&_Fils'
FROM article
         JOIN fournisseur ON article.fournisseur_id = fournisseur.id
WHERE fournisseur.nom LIKE  '%Dubois & Fils%';

-- i. Calculez la moyenne des prix des articles de chaque fournisseur
SELECT fournisseur.nom AS fournisseur, AVG(article.prix) AS 'prix_moyen_articles'
FROM article
         JOIN fournisseur ON article.fournisseur_id = fournisseur.id
GROUP BY fournisseur.nom;

-- j. Sélectionnez tous les bons de commandes émis entre le 01/03/2019 et le 05/04/2019 à 12h00.
SELECT *
FROM bon
WHERE date  BETWEEN  '2019-01-01' AND '2019-04-05';

-- k. Sélectionnez les divers bons de commande qui contiennent des boulons
SELECT bon.*
FROM bon
         JOIN compo ON bon.id = compo.id_bon
         JOIN article ON article.id = compo.id_art
WHERE article.designation LIKE '%Boulon%';

-- l. Sélectionnez les divers bons de commande qui contiennent des boulons avec le nom du fournisseur associé.
SELECT bon.*, fournisseur.nom
FROM bon
         JOIN compo ON bon.id = compo.id_bon
         JOIN article ON article.id = compo.id_art
        JOIN  fournisseur ON article.fournisseur_id = fournisseur.id
WHERE article.designation LIKE '%Boulon%';

-- m. Calculez le prix total de chaque bon de commande
SELECT SUM(article.prix * compo.qte)
FROM bon
         JOIN compo ON bon.id = compo.id_bon
         JOIN article ON article.id = compo.id_art
GROUP BY bon.id;

-- n Comptez le nombre d’articles de chaque bon de commande
SELECT bon.id,
       SUM(compo.qte) AS nb_articles_total
FROM bon
         JOIN compo ON bon.id = compo.id_bon
         JOIN article ON article.id = compo.id_art
GROUP BY bon.id;

-- O Affichez les numéros de bons de commande qui contiennent plus de 25 articles et affichez le nombre d’articles de chacun de ces bons de commande

SELECT bon.id,
       SUM(compo.qte) AS nb_articles_total
FROM bon
         JOIN compo ON bon.id = compo.id_bon
         JOIN article ON article.id = compo.id_art
GROUP BY bon.id
HAVING nb_articles_total > 25;

-- p. Calculez le coût total des commandes effectuées sur le mois d’avril
SELECT SUM(article.prix * compo.qte) AS total
FROM bon
         JOIN compo ON bon.id = compo.id_bon
         JOIN article ON article.id = compo.id_art
WHERE bon.date BETWEEN '2019-04-01' AND '2019-04-30';
