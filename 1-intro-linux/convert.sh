#!/bin/bash

exec < ../data.csv
read header
echo $header > data_celcius.csv
while IFS=","  read -r step x y z temp
do
    echo "$step,$x,$y,$z,$((($temp-32)*5/9))" >>  data_celcius.csv

done
