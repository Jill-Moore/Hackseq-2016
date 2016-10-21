#!/bin/bash

#Jill Moore
#October 2016
#hackseq 2016 - Group 4

#Script to convert a bam file to a bigwig file
#Usage: ./bamToBigWig data-prefix

BASE_PATH=/hackathon/Hackathon_Project_4
data=$1

chromInfo=$BASE_PATH/GENOME_ANNOTATIONS/ChromInfo.txt

bedtools bamtobed -i $data.bam -split | sort -k1,1 > $data.bed
$BASE_PATH/SOFTWARE/bedItemOverlapCount hg19 -chromSize=$chromInfo $data.bed \
| sort -k1,1 -k2,2n > $data.bedGraph

$BASE_PATH/SOFTWARE/bedGraphToBigWig $data.bedGraph $chromInfo $data.bigWig

rm $data.bed $data.bedGraph
