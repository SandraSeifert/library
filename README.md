# Bibliotheks-Service

Web-Anwendung für die eigene Bibliothek, am Handy erreichbar.

## Vision

Im Buchladen scanne ich den Barcode eines Buches und sehe sofort, ob ich es schon besitze. Der Bestand kommt aus den Book-Notes meines Obsidian-Vaults. Dazu halte ich fest, welche Bücher ich in einer Bibliothek ausleihen möchte, und pflege eine Wunschliste, die ich mit anderen teilen kann.

## Kernfunktionen

1. **Nachschlagen:** ISBN eingeben oder Barcode scannen und prüfen: "Hab ich das schon?"
2. **Leih-Wünsche:** Bücher erfassen, die ich ausleihen möchte, und abhaken, sobald ich sie habe
3. **Wunschliste:** Bücher vormerken, z. B. für Anlässe wie Weihnachten

## Bestand

Der Bestand wird aus den Book-Notes meines Obsidian-Vaults importiert, einseitig und vom Rechner aus angestoßen. Die App legt keine Bücher an. Bücher ohne ISBN (ältere Ausgaben) findet man per Titelsuche.

## Technik

Git/GitHub · PostgreSQL (Docker) · Go (Backend) · TypeScript (Frontend)

## Arbeitsweise

Branches, Commits und Pull Requests sind in [CONTRIBUTING.md](CONTRIBUTING.md) beschrieben.

## Roadmap

1. Git-Handwerk und Projektgerüst
2. Datenmodell und Docker
3. Go-Backend
4. TypeScript-Frontend
5. Barcode-Scanner
6. Leih-Wünsche und Wunschliste
7. Deployment und Sicherheit

## Status

Projektgerüst. Backlog siehe [Issues](https://github.com/SandraSeifert/library/issues).

