-- Seed: zehn echte Bücher aus dem Vault (Stand 19.11.2026)

INSERT INTO autor (name) VALUES
  ('Henry Kissinger'), ('Eric Schmidt'), ('Craig Mundie'),
  ('Roberto Simanowski'), ('Nassim Nicolas Taleb'),
  ('George R. R. Martin'), ('Walter Moers'), ('Sascha Lobo'),
  ('Jannis Brühl'), ('Mary Beard');

INSERT INTO buch (note_name, titel, isbn, besitz, gelesen, wunschliste, cover) VALUES
  ('KI Genesis', 'KI Genesis', '9783689320089', TRUE, FALSE, FALSE, '9783689320089.jpg'),
  ('Sprachmaschinen', 'Sprachmaschinen', '9783406837531', TRUE, FALSE, FALSE, '9783406837531.jpg'),
  ('Narren des Zufalls', 'Narren des Zufalls', '9783570553909', TRUE, FALSE, FALSE, '9783570553909.jpg'),
  ('Der schwarze Schwan', 'Der schwarze Schwan', '9783570553923', TRUE, FALSE, FALSE, '9783570553923.jpg'),
  ('Der Sohn des Greifen', 'Der Sohn des Greifen', '9783764531041', TRUE, FALSE, FALSE, '9783764531041.jpg'),
  ('Die dunkle Königin', 'Die dunkle Königin', '9783442268603', TRUE, TRUE, FALSE, '9783442268603.jpg'),
  ('Prinzessin Insomnia und der alptraumfarbene Nachtmahr', 'Prinzessin Insomnia und der alptraumfarbene Nachtmahr', '9783813507850', TRUE, TRUE, FALSE, '9783813507850.png'),
  ('Realitätsschock', 'Realitätsschock', '9783462000436', TRUE, TRUE, FALSE, '9783462053227.jpg'),
  ('Disruption', 'Disruption', '9783421070562', FALSE, TRUE, FALSE, '9783421070562.jpg'),
  ('SPQR - Die tausendjährige Geschichte Roms', 'SPQR - Die tausendjährige Geschichte Roms', '9783100022301', TRUE, FALSE, FALSE, '9783100022301.jpg');

-- Zuordnung Buch <-> Autor (position = Reihenfolge in der Frontmatter-Liste)
INSERT INTO buch_autor (buch_id, autor_id, position)
SELECT b.id, a.id, v.position
FROM (VALUES
  ('KI Genesis', 'Henry Kissinger', 1),
  ('KI Genesis', 'Eric Schmidt', 2),
  ('KI Genesis', 'Craig Mundie', 3),
  ('Sprachmaschinen', 'Roberto Simanowski', 1),
  ('Narren des Zufalls', 'Nassim Nicolas Taleb', 1),
  ('Der schwarze Schwan', 'Nassim Nicolas Taleb', 1),
  ('Der Sohn des Greifen', 'George R. R. Martin', 1),
  ('Die dunkle Königin', 'George R. R. Martin', 1),
  ('Prinzessin Insomnia und der alptraumfarbene Nachtmahr', 'Walter Moers', 1),
  ('Realitätsschock', 'Sascha Lobo', 1),
  ('Disruption', 'Jannis Brühl', 1),
  ('SPQR - Die tausendjährige Geschichte Roms', 'Mary Beard', 1)
) AS v(note_name, autor_name, position)
JOIN buch  b ON b.note_name = v.note_name
JOIN autor a ON a.name = v.autor_name;

-- TESTFÄLLE (erfunden, nicht aus dem Vault; vor dem Import wieder löschen)
INSERT INTO buch (note_name, titel, isbn, besitz, gelesen, wunschliste) VALUES
  ('Testbuch ohne ISBN', 'Testbuch ohne ISBN', NULL, TRUE, FALSE, FALSE),
  ('Testbuch Wunschliste', 'Testbuch Wunschliste', NULL, FALSE, FALSE, TRUE);