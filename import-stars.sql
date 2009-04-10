load data local infile 'KIC.txt' into table stars
IGNORE 16 LINES
(@var1)
SET number=SUBSTR(@var1,1,13),
coordinate=SUBSTR(@var1,17,24),
mag=SUBSTR(@var1,45,5),
teff=SUBSTR(@var1,54,4),
logg=SUBSTR(@var1,61,5),
mh=SUBSTR(@var1,69,5),
adopted_by=SUBSTR(@var1,78,23);

DELETE FROM stars WHERE number = "-------------";
