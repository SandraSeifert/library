SELECT titel, besitz, gelesen, wunschliste
FROM buch
WHERE isbn = '9783421070562';

SELECT b.titel, string_agg(a.name, ', ' ORDER BY ba.position) AS autoren
FROM buch b
left JOIN buch_autor ba ON ba.buch_id = b.id
left JOIN autor a       ON a.id = ba.autor_id
GROUP BY b.id, b.titel
ORDER BY b.titel;

SELECT DISTINCT b.titel, b.isbn
FROM buch b
LEFT JOIN buch_autor ba ON ba.buch_id = b.id
LEFT JOIN autor a       ON a.id = ba.autor_id
WHERE b.titel ILIKE '%taleb%' OR a.name ILIKE '%taleb%';