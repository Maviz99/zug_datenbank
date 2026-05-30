# Relationales Datenbankdesign: Zugverbindungen

Dieses Repository zeigt die schrittweise Übersetzung eines komplexen Entity-Relationship-Modells (ER-Modell) in ein optimiertes relationales Datenbankschema. Das Projekt basiert auf einer universitären Fallstudie (Lehrbuch Kemper/Eickler) und demonstriert fortgeschrittene Konzepte des Systemdesigns.

## Kernfeatures des Designs:
* **Eins-zu-Viele ($1:N$) Optimierung:** Eliminierung von redundanten Beziehungstabellen durch gezielten Einsatz von Fremdschlüsseln auf der $N$-Seite zur Wahrung der referentiellen Integrität.
* **Ternäre Beziehungen:** Saubere relationale Abbildung einer 3er-Beziehung zwischen drei Entitäten unter Verwendung von zusammengesetzten Primärschlüsseln.
* **Rekursive Rollenauflösung:** Abbildung von identischen Entitätstypen in unterschiedlichen Beziehungsrollen durch explizite Spaltenumbenennung.

## Das relationale Schema (Kurznotation):
* 

## Verzeichnisstruktur
* `schema.sql`: Lauffähiger SQL-Code (PostgreSQL-Syntax) für die Tabellenerstellung.
* `README.md`: Dokumentation des Entwurfsprozesses.