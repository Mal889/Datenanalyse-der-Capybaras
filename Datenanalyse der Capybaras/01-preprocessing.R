# 1. Bibliotheken laden
library(tidyverse)

# 2. Rohdaten einlesen
data_raw <- read_csv("raw_data/Rep01_anonymized(1).csv")
data_demographics <- read_csv("raw_data/Rep01_demographics_anonymized(3).csv") # Falls der Name am Ende abgeschnitten war, hier anpassen!

# 4. Datenbereinigung: "Zombie-Rows" entfernen
data_cleaned <- data_raw %>% 
  filter(!is.na(condition) & !is.na(writing_assignment))

nrow(data_raw)       # Anzahl vor der Bereinigung
nrow(data_cleaned)   # Anzahl nach der Bereinigung

summary(data_demographics)
# Reinigung von data demographics
install.packages("janitor")
library(janitor)

datensatz_demo_cleaned <- data_demographics %>% 
  remove_empty(which = "rows")
summary(data_cleaned %>% select(attentive, video_problems, screen_control))

# 5. Spezifische Ausschlusskriterien (Präregistrierung)
data_final <- data_cleaned %>% 
  # Wir behalten nur die Personen, die bei 'attentive' eine 1 eingetragen haben
  filter(attentive == 1)

# Kontrolle der verbleibenden Versuchspersonen
nrow(data_final)

# 6. Bereinigten Datensatz exportieren
write_csv(data_final, "processed_data/Rep01_cleaned.csv")
