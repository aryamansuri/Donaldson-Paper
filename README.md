# Does Temperature Play a Part in an Increase in Homicide Statistics? An Analysis of the Toronto Homicide statistics of the Last 20 years

## Overview

This paper analyzes data from Toronto Police homicide statistics over the past 20 years to see if warmer months see an increase in homicide statistics as compared to colder months.

## File Structure

The repo is structured as:

-   `input/data` contains the data sources used in analysis including the raw data.
-   `outputs/data` contains the cleaned datasets that were constructed.
-   `outputs/paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.

## How to Run

### Install the following R packages

- 'opendatatoronto'
- 'tidyverse
- 'janitor'
- 'knitr'

### Code Execution

- Run scripts/01-download_data.R to download raw data
- Run scripts/02-data_cleaning.R to generate clean data as a csv file
- Render outputs/paper/paper.qmd to generate a PDF of the paper on Toronto Homicides

## Statement on LLM usage

Parts of the conclusion of the paper were written with the help of the Chat-GPT-3.5. The entire chat history is available in inputs/llm/Toronto Homicides_ Weather Impact.txt.
