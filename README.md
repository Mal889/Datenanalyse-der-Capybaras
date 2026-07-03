# Replikationsstudie – Datenbereinigung

Dieses Repository enthält das R-Projekt und die dazugehörige Ordnerstruktur zur Bereinigung des Datensatzes unserer psychologischen Replikationsstudie.

## Projektstruktur

* **/doc**: Enthält die Data Dictionaries der Studie (Sowohl menschenlesbar als auch maschinenlesbar).
* **/raw_data**: Enthält die unveränderten, anonymisierten Rohdaten (Rep01_anonymized.csv & Rep01_demographics_anonymized.csv).
* **/processed_data**: Enthält den finalen, bereinigten Datensatz (Rep01_cleaned.csv), der für die anschließende Datenanalyse bereit ist.
* **/plots**: Ordner für die Visualisierungen im weiteren Verlauf des Projekts.

## Datenbereinigung (`01-preprocessing.R`)

Im Skript `01-preprocessing.R` wurden folgende Bereinigungsschritte gemäß der Präregistrierung durchgeführt:
1. **Ausschluss von unvollständigen Daten ("Zombie-Rows"):** Fälle, bei denen die Zuweisung zur Bedingung oder das Schreib-Assignment fehlten, wurden entfernt.
2. **Ausschluss nach Aufmerksamkeitskriterien:** Teilnehmende, die das Kriterium im Aufmerksamkeitstest (`attentive == 1`) nicht erfüllt haben, wurden exkludiert.

**Stichprobengröße:**
* Rohdaten: 117 Fälle
* Nach Zombie-Row-Filter: 95 Fälle
* Finaler Datensatz: 92 Fälle

# 7. Data Dictionary von Excel in JSON konvertieren
# (Falls die Pakete noch nicht installiert sind, einmalig ausführen: install.packages("jsonlite"))
library(readxl)
library(jsonlite)

# 1. Die menschenlesbare Excel-Datei aus dem /doc-Ordner einlesen
dictionary_data <- read_excel("doc/data_dictionary.xlsx")

# 2. Als maschinenlesbares JSON in den /doc-Ordner exportieren
write_json(dictionary_data, "doc/data_dictionary.json", pretty = TRUE)

# Jetzt mit dem exakt passenden Namen (Großbuchstaben und Leerzeichen)
dictionary_data <- read_excel("doc/Data Dictionary.xlsx")
