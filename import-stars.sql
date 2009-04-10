load data local infile 'KIC.txt' REPLACE into table stars
IGNORE 16 LINES
(@var1)
SET id=SUBSTR(@var1, 4,10),
number=SUBSTR(@var1,1,13),
lon_d=SUBSTR(@var1,17,2),
lon_m=SUBSTR(@var1,20,2),
lon_s=SUBSTR(@var1,23,5),
lat_d=SUBSTR(@var1,31,3),
lat_m=SUBSTR(@var1,35,2),
lat_s=SUBSTR(@var1,38,4),
mag=SUBSTR(@var1,45,5),
teff=SUBSTR(@var1,54,4),
logg=SUBSTR(@var1,61,5),
mh=SUBSTR(@var1,69,5),
adopted_by=SUBSTR(@var1,78,23);

DELETE FROM stars WHERE number = "-------------";
