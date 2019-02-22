DROP TABLE IF EXISTS flight_data;

CREATE TABLE flight_data (fid int, year int, month_id int, day_of_month int, day_of_week_id int, Airline char(32), flight_num int, Origin char(32), origin_state char(32), Destination char(32), dest_state char(32), departure_delay int, taxi_out int, arrival_delay int, canceled int, actual_time int, distance int);

DROP TABLE IF EXISTS flight;

CREATE TABLE flight (Airline char(32), Origin char(32), Destination char(32));

INSERT INTO flight SELECT DISTINCT Airline, Origin, Destination FROM flight_data;