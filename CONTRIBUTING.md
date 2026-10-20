# Arbeitsweise

## Branches
- `main` ist immer lauffähig, gearbeitet wird nur auf Branches
- Neuer Funktions-Branch: `feature/<issue-nr>-kurzname`, z. B. `feature/1-readme`
- Fehlerbehebung: `fix/<issue-nr>-kurzname`

## Commit-Nachrichten
- Im Imperativ, kurz, auf Englisch: `Add book table`, `Fix duplicate ISBN check`
- Eine logische Änderung pro Commit

## Ablauf pro Issue
1. `git switch main` und `git pull`
2. `git switch -c feature/<nr>-kurzname`
3. Arbeiten, committen, `git push -u origin feature/<nr>-kurzname`
4. Pull Request mit `Closes #<nr>` in der Beschreibung
5. Selbst prüfen (Files changed), mergen, Branch löschen

## Labels
`feature` (neue Funktion) · `lernen` (Lernaufgabe) · `bug` (Fehler)

## Versionen
Tags `v0.x.0` pro Projektphase, `v1.0.0` zum Abschluss
