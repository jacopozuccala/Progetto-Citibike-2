-- Raccolta del numero di viaggi nei giorni della settimana e delle fasce orarie
-- Collection of the number of trips by weekday and time slot

CREATE OR REPLACE VIEW usage_by_day_hour AS
SELECT 
    CASE EXTRACT(DOW FROM started_at)
        WHEN 0 THEN 'Domenica'
        WHEN 1 THEN 'Lunedì'
        WHEN 2 THEN 'Martedì'
        WHEN 3 THEN 'Mercoledì'
        WHEN 4 THEN 'Giovedì'
        WHEN 5 THEN 'Venerdì'
        WHEN 6 THEN 'Sabato'
    END AS giorno_settimana,
    
    CASE 
        WHEN EXTRACT(HOUR FROM started_at) BETWEEN 0 AND 5 THEN 'Notte (00-05)'
        WHEN EXTRACT(HOUR FROM started_at) BETWEEN 6 AND 11 THEN 'Mattina (06-11)'
        WHEN EXTRACT(HOUR FROM started_at) BETWEEN 12 AND 17 THEN 'Pomeriggio (12-17)'
        WHEN EXTRACT(HOUR FROM started_at) BETWEEN 18 AND 23 THEN 'Sera (18-23)'
    END AS fascia_oraria,
    
    COUNT(*) AS total_rides
FROM trips2
GROUP BY giorno_settimana, fascia_oraria
ORDER BY giorno_settimana, fascia_oraria;
