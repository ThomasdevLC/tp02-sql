SET SQL_SAFE_UPDATES = 0;

-- 3) a. Supprimer dans la table compo toutes les lignes concernant les bons de commande d’avril 2019

DELETE compo
FROM compo
    JOIN bon ON bon.id = compo.id_bon
WHERE bon.date BETWEEN  '2019-04-01' AND '2019-04-30';




-- 3) b. Supprimer dans la table bon tous les bons de commande d’avril 2019.
DELETE bon
FROM bon
WHERE bon.date BETWEEN  '2019-04-01' AND '2019-04-30';



