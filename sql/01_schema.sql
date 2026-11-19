CREATE TABLE buch (
    id               BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    note_name        TEXT    NOT NULL UNIQUE,
    titel            TEXT    NOT NULL,
    isbn             TEXT    UNIQUE,
    besitz           BOOLEAN NOT NULL DEFAULT FALSE,
    gelesen          BOOLEAN NOT NULL DEFAULT FALSE,
    wunschliste      BOOLEAN NOT NULL DEFAULT FALSE,
    cover            TEXT,
    notiz_markdown   TEXT,
    CONSTRAINT isbn_nicht_leer CHECK (isbn IS NULL OR length(isbn) IN (10, 13))
);

CREATE TABLE autor (
    id    BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name  TEXT NOT NULL UNIQUE
);

CREATE TABLE buch_autor (
    buch_id   BIGINT NOT NULL REFERENCES buch(id) ON DELETE CASCADE,
    autor_id  BIGINT NOT NULL REFERENCES autor(id),
    position  INTEGER NOT NULL DEFAULT 1,
    PRIMARY KEY (buch_id, autor_id)
);

