#!/bin/bash
for file in *.mdb
do
mdb-export $file StudyAreaIndustryData |xargs -l echo $file "," >> output.csv
done
