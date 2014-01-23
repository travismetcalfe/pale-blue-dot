load data local infile 'KIC.txt' REPLACE into table stars
(@var1)
SET id=SUBSTR(@var1, 4,10),
number=SUBSTR(@var1,1,13),
flag=SUBSTR(@var1,17,1),
lon_d=SUBSTR(@var1,21,2),
lon_m=SUBSTR(@var1,24,2),
lon_s=SUBSTR(@var1,27,5),
lat_d=SUBSTR(@var1,35,3),
lat_m=SUBSTR(@var1,39,2),
lat_s=SUBSTR(@var1,42,4),
mag=SUBSTR(@var1,49,5),
teff=SUBSTR(@var1,58,4),
logg=SUBSTR(@var1,65,5),
mh=SUBSTR(@var1,73,5),
adopted_by=SUBSTR(@var1,82);

DELETE FROM stars WHERE number = " ";
DELETE FROM stars WHERE number = "-------------";

