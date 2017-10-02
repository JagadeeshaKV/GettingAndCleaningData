---
title: "README"
author: "Jagadeesha"
date: "September 30, 2017"
output: html_document
---


## Getting and Cleaning data - Course Project

This repository hosts the R code and documentation files for the Data Science's course project "Getting and Cleaning data".

The dataset being used is available at <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>


## Files

Following are the project files available in this repository.

* ```CodeBook.md``` - Describes the variables, data and data clean up process.
* ```run_analysis.R``` - Contains the source code for all 5 steps.
* ```tidydataset.txt``` - The output of the 5th step (Contains the tidy dataset).

#### run_analysis.R

This file does the following:

* Download the dataset from the source.
* Load the training data.
* Load the test data.
* Load the feature.
* Load the activity labels. 
* Assign column names.
* Merge the training and test datasets.
* Create a tidy dataset and writes it to a text file.

