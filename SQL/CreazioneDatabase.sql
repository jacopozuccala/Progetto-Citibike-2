-- Creazione della tabella
-- Table cration

DROP TABLE IF EXISTS trips2;

CREATE TABLE trips2 (
    ride_id VARCHAR(255),
    rideable_type VARCHAR(50),
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name TEXT,
    start_station_id TEXT,
    end_station_name TEXT,
    end_station_id TEXT,
    start_lat NUMERIC,
    start_lng NUMERIC,
    end_lat NUMERIC,
    end_lng NUMERIC,
    member_casual VARCHAR(20)
);
