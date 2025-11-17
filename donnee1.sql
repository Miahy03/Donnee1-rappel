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

-- 3 - Afficher les congés de tel sorte qu’on voie l’id du congé, le début du congé, la fin du congé, le nom & prénom de l’employé qui prend congé et le nom de son équipe.

SELECT C.id,
       C.date_debut,
       C.date_fin,
       E.prenom,
       E.nom,
       T.nom AS nom_equipe
FROM Conge C
JOIN Employe E
    ON C.employe_id = E.id
LEFT JOIN Equipe T
    ON E.equipe_id = T.id;


-- 4. Affichez par le nombre d’employés par contract_type, vous devez afficher le type de contrat, et le nombre d’employés associés.

SELECT E.type_contrat, COUNT(*)
FROM Employe E
GROUP BY E.type_contrat;

-- 5. Afficher le nombre d’employés en congé aujourd'hui. La période de congé s'étend de start_date inclus jusqu’à end_date inclus.

SELECT COUNT(DISTINCT C.employe_id)
FROM Conge C
WHERE CURRENT_DATE BETWEEN C.date_debut AND C.date_fin;


-- 6. Afficher l’id, le nom, le prénom de tous les employés + le nom de leur équipe qui sont en congé aujourd’hui. Pour rappel, la end_date est incluse dans le congé, l’employé ne revient que le lendemain. 

SELECT E.id,
       E.prenom,
       E.nom,
       T.nom AS nom_equipe
FROM Employe E
LEFT JOIN Equipe T
    ON E.equipe_id = T.id
JOIN Conge C
    ON C.employe_id = E.id
WHERE CURRENT_DATE BETWEEN C.date_debut AND C.date_fin;
