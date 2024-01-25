# Analysis of Annual Toronto Public Library's Circulation and Visits by Wards Prior to and Post-COVID

## Paper Overview

This paper analyzes Toronto Public Library circulation and visitation usage patterns by ward between 2018 and 2022. The overall narrative of the paper aims to assess whether or not there were differences in pre and post-pandemic usage patterns. 

## File Strcture

This repo is structured by:

-   `input/data` which contains the data sources used in analysis in their raw format.
-   `outputs/data` which contains the cleaned data sources and constructed data sets used to generate the paper.
-   `outputs/paper` which contains the files used to generate the paper, including the Quarto document, reference bibliography file and PDF of the paper.
-   `scripts` which contains the R scripts used to simulate, test, download and clean data.

## How to Run

1.  Run `scripts/00-download_data.R` to download the raw data sets
2.  Run `scripts/01-data_cleaning.R` to generate the cleaned data sets
3.  Run `outputs/paper.qmd` to generate the PDF of the paper

## Statement on LLM Usage

No aspects of the code or text utilized LLMs in their creation. Code references are cited in the paper or commented above inspired lines with a link. 
