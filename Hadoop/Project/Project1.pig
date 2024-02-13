inputDialogues4 = LOAD 'hdfs:///user/rajesh/inputs/episodeIV_dialogues.txt' USING PigStorage('\t') AS (name:chararray, line:chararray);
inputDialogues5 = LOAD 'hdfs:///user/rajesh/inputs/episodeV_dialogues.txt' USING PigStorage('\t') AS (name:chararray, line:chararray);
inputDialogues6 = LOAD 'hdfs:///user/rajesh/inputs/episodeVI_dialogues.txt' USING PigStorage('\t') AS (name:chararray, line:chararray);

ranked4 = RANK inputDialogues4;
OnlyDialogues4 = FILTER ranked4 BY (rank_inputDialogue4 >2);
ranked5 = RANK inputDialogues5;
OnlyDialogues4 = FILTER ranked4 BY (rank_inputDialogue5 >2);
ranked6 = RANK inputDialogues6;
OnlyDialogues4 = FILTER ranked4 BY (rank_inputDialogue6 >2);

inputData = UNION OnlyDialogues4, OnlyDialogues5, OnlyDialogues6;

groupByName = GROUP inputData BY name;

names = FOREACH groupByName GENERATE $0 as name, count($1) as no_of_lines;
namesOrdered = ORDER names BY no_of_lines DESC;