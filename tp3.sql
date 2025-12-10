select * FROM article;

select * FROM article WHERE prix > 2;

select * FROM article WHERE prix >= 2 AND prix<=6.25;

select * FROM article WHERE prix BETWEEN 2 AND 6.25;

select * FROM article WHERE prix NOT BETWEEN 2 AND 6.25 ORDER BY prix DESC ;

select * FROM article WHERE prix NOT BETWEEN 2 AND 6.25 ORDER BY prix DESC ;

select * FROM article WHERE fournisseur_id = 1 OR fournisseur_id = 3 ;

select * FROM article
WHERE fournisseur_id IN (
    SELECT id
    FROM fournisseur
    WHERE id = 1 OR id = 3
);

select * FROM article
WHERE fournisseur_id IN (
    SELECT id
    FROM fournisseur
    WHERE NOT id = 1 OR id = 3
);

select * FROM bon
WHERE date BETWEEN '2019-02-01' AND  '2019-04-30';









