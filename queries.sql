--create table
DROP TABLE if exists blue_onion.starlink_data_points;

CREATE TABLE blue_onion.starlink_data_points (	
	_id char(24) NOT NULL,
	_at timestamp NOT NULL,
	day_of_month integer NOT NULL,
	latitude numeric (5,2),
	longitude numeric (5,2)
)
PARTITION BY RANGE (day_of_month);

-- partitions
CREATE TABLE blue_onion.starlink_data_points_partition_1 PARTITION OF blue_onion.starlink_data_points FOR VALUES FROM (1) TO (10);
CREATE INDEX idx_day_partition_1 ON blue_onion.starlink_data_points_partition_1(day_of_month);

CREATE TABLE blue_onion.starlink_data_points_partition_2 PARTITION OF blue_onion.starlink_data_points FOR VALUES FROM (10) TO (20);
CREATE INDEX idx_day_partition_2 ON blue_onion.starlink_data_points_partition_2(day_of_month);

CREATE TABLE blue_onion.starlink_data_points_partition_3 PARTITION OF blue_onion.starlink_data_points FOR VALUES FROM (20) TO (31);
CREATE INDEX idx_day_partition_3 ON blue_onion.starlink_data_points_partition_3(day_of_month);
