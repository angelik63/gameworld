/* Requete 1 */
SELECT j.pseudo, s.id_session, s.score FROM joueurs AS j
INNER JOIN scores AS s ON j.id = s.id_joueur
WHERE s.id_session = 12
ORDER BY s.score DESC; 

/* Requete 2 */
SELECT j.id, j.pseudo FROM joueurs AS j
LEFT JOIN scores AS s ON j.id = s.id_joueur
WHERE s.id_joueur IS NULL;

/* Requete 3 */
SELECT j.titre,  g.nom FROM jeux AS j 
JOIN genres AS g ON j.id_genre = g.id;

/* Requete 4 */
SELECT j.id, j.pseudo, COUNT(s.id_session) AS total_session FROM joueurs AS j
LEFT JOIN scores AS s ON j.id = s.id_joueur
GROUP BY j.id, j.pseudo;

/* Requete 5 */
SELECT j.pseudo, AVG(s.score) AS score_moyen FROM joueurs AS j
LEFT JOIN scores AS s ON j.id = s.id_joueur
GROUP BY j.id, j.pseudo;

/* Requete 6 */
SELECT j.pseudo, s.score, jx.titre, ss.date_session FROM joueurs AS j
LEFT JOIN scores AS s ON j.id = s.id_joueur
LEFT JOIN jeux AS jx ON jx.id = s.id_session
LEFT JOIN sessions AS ss ON s.id_session = ss.id
WHERE s.score > 1400;
 
/* Requete 7 */
SELECT j.pseudo, e.nom, j.pays FROM equipes AS e
JOIN membres_equipes AS me ON e.id = me.id_equipe
JOIN joueurs AS j ON me.id_joueur = j.id;

/* Requete 8 */
SELECT j.titre FROM jeux AS j
JOIN sessions AS s ON j.id = s.id_jeu
GROUP BY j.id, j.titre
HAVING COUNT(s.id_jeu) > 3;

/* Requete 9 */
SELECT ss.id, j.titre, ss.date_session, COUNT(s.id_joueur) AS nombre_joueurs FROM sessions AS ss
INNER JOIN jeux j ON ss.id_jeu = j.id
LEFT JOIN scores s ON ss.id = s.id_session
GROUP BY ss.id, j.titre, ss.date_session;

/* Requete 10 */
SELECT j.titre, AVG(s.score) AS score_moyen FROM jeux j
JOIN sessions ss ON j.id = ss.id_jeu
JOIN scores s ON ss.id = s.id_session
GROUP BY j.titre
ORDER BY score_moyen DESC;
