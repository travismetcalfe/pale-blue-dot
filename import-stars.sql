load data local infile 'KIC.txt' REPLACE into table stars
(@var1)
SET id=SUBSTR(@var1, 5,10),
number=SUBSTR(@var1,1,14),
flag=SUBSTR(@var1,18,1),
const=SUBSTR(@var1,22,3),
lon_d=SUBSTR(@var1,28,2),
lon_m=SUBSTR(@var1,31,2),
lon_s=SUBSTR(@var1,34,4),
lat_sign=SUBSTR(@var1,42,1),
lat_d=SUBSTR(@var1,42,3),
lat_m=SUBSTR(@var1,46,2),
lat_s=SUBSTR(@var1,49,2),
mag=SUBSTR(@var1,56,5),
adopted_by=SUBSTR(@var1,65);

DELETE FROM stars WHERE flag = "0";
DELETE FROM stars WHERE number = " ";
DELETE FROM stars WHERE number = "-------------";

