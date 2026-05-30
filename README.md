# Relationales Datenbankdesign: Zugverbindungen (Fahrplan simples Model)

Dieses Repository zeigt die schrittweise Übersetzung eines komplexen Entity-Relationship-Modells (ER-Modell) in ein optimiertes relationales Datenbankschema. Das Projekt basiert auf einer universitären Fallstudie (Lehrbuch Kemper/Eickler) und demonstriert fortgeschrittene Konzepte des Systemdesigns.

## Kernfeatures des Designs:
* **Eins-zu-Viele ($1:N$) Optimierung:** Eliminierung von redundanten Beziehungstabellen durch gezielten Einsatz von Fremdschlüsseln auf der $N$-Seite zur Wahrung der referentiellen Integrität.
* **Ternäre Beziehungen:** Saubere relationale Abbildung einer 3er-Beziehung zwischen drei Entitäten unter Verwendung von zusammengesetzten Primärschlüsseln.
* **Rekursive Rollenauflösung:** Abbildung von identischen Entitätstypen in unterschiedlichen Beziehungsrollen durch explizite Spaltenumbenennung.

## Das relationale Schema:
* **Staedte** (Name: VARCHAR `[PK]`, Bundesland: VARCHAR `[PK]`)
* **Bahnhoefe** (Name: VARCHAR `[PK]`, AnzahlGleise: INT, StadtName: VARCHAR, Bundesland: VARCHAR)
* **Zuege** (ZugNr: INT `[PK]`, Laenge: INT, StartBahnhof: VARCHAR, ZielBahnhof: VARCHAR)
* **verbindet** (ZugNr: INT `[PK]`, Von_BHf: VARCHAR `[PK]`, Nach_BHf: VARCHAR, Abfahrt: TIME, Ankunft: TIME)

## Verzeichnisstruktur
* `schema.sql`: Lauffähiger SQL-Code (PostgreSQL-Syntax) für die Tabellenerstellung.
* `README.md`: Dokumentation des Entwurfsprozesses.
  
## Die Logik für dieses Modell (Fahrplan-Routing):
1. **Direktverbindung prüfen:** Das System sucht in der Tabelle `Zuege` nach einer direkten Route, bei der `StartBahnhof` und `ZielBahnhof` exakt mit den Nutzerwünschen übereinstimmen.
2. **Multi-Stopp-Routing (Umstiege):** Falls keine Direktverbindung existiert, analysiert das System die Zwischenstopps in der Tabelle `verbindet`. Es sucht nach Kombinationen, bei denen die Ankunftszeit des ersten Zuges vor der Abfahrtszeit des Anschlusszuges liegt.