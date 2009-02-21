load data local infile 'kepler.txt' into table stars
(@var1)
SET number=SUBSTR(@var1,1,13),
coordinate=SUBSTR(@var1,17,24),
mag=SUBSTR(@var1,45,5),
teff=SUBSTR(@var1,54,4),
logg=SUBSTR(@var1,61,5),
mh=SUBSTR(@var1,69,5),
adopted_by=SUBSTR(@var1,78,23);
