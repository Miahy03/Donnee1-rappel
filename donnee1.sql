-- 1 - Afficher l’id, prenom, nom des employés qui n’ont pas d’équipe. 

SELECT E.id, E.prenom, E.nom
FROM Employe E
WHERE E.equipe_id IS NULL;


-- 2 - Afficher l’id, prenom, nom des employés qui n’ont jamais pris de congé de leur vie.
SELECT E.id, E.prenom, E.nom
FROM Employe E
WHERE E.id NOT IN (
    SELECT C.employe_id
    FROM Conge C
);

--3