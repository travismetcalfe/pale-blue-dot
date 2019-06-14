load data local infile 'KIC.txt' REPLACE into table stars
(@var1)
SET id=SUBSTR(@var1, 5,10),
number=CONVERT(SUBSTR(@var1,1,14) USING utf8mb4),
flag=SUBSTR(@var1,18,1),
const=CONVERT(SUBSTR(@var1,22,3) USING utf8mb4),
lon_d=SUBSTR(@var1,28,2),
lon_m=SUBSTR(@var1,31,2),
lon_s=SUBSTR(@var1,34,4),
lat_sign=CONVERT(SUBSTR(@var1,42,1) USING utf8mb4),
lat_d=SUBSTR(@var1,42,3),
lat_m=SUBSTR(@var1,46,2),
lat_s=SUBSTR(@var1,49,2),
mag=SUBSTR(@var1,56,5),
adopted_by=CONVERT(SUBSTR(@var1,65) USING utf8mb4);

DELETE FROM stars WHERE flag = "0";
DELETE FROM stars WHERE number = " ";
DELETE FROM stars WHERE number = "-------------";

