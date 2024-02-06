inputFile = LOAD 'hdfs:///user/hemant/pigactivity' USING PigStorage('\t') AS (name:chararray, dialogues:chararray);
grpd = GROUP inputFile BY name;
cntd = FOREACH grpd GENERATE $0 AS nameSpoken, COUNT($1) AS dialoguesSpoken;
ordby = ORDER cntd BY dialoguesSpoken DESC;
rmf hdfs:///user/hemant/pigactivity/results
STORE ordby INTO 'hdfs:///user/hemant/pigactivity/results';
