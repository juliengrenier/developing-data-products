---
title       : Predicting wine quality using chemical analysis
subtitle    : 
author      : Julien Grenier
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Goal

Using 2 data sets (from Cortez et al., 2009), we want to predict the wine quality (poor, standard or great) based on physicochemical attributes of the wine.

## Usage
This application (...) can be use by wine makers (with the help of a chemist) to make sure their wine contains the right chemical attributes which will yield a great quality wine.

--- .class #id 

## Data Summary

Each data sets contains 11 predictors and quality output (provided as an average of 3 wine experts). To simplify our problem we remap the original 0-10 quality scale to a 3 levels quality scale ("poor", "standard", "great").

Red wines:

```
##     poor standard    great 
##       63     1319      217
```

White wines:

```
##     poor standard    great 
##      183     3655     1060
```

--- .class #id 

## Model strategy

We trained 2 random-forrest models, one for each wine colors. We splitted each datasets into 2 (70% train, 30% test) and used a repeated cross-validation (10-folds 10 times) re-sampling method and used Principal Component Analysis (PCA) in pre-processing.





## Model Analysis

### Red wines

```
##           Reference
## Prediction poor standard great
##   poor        0        0     0
##   standard   18      385    33
##   great       0       10    32
```
Accuracy 95% confidence interval is [0.8391, 0.901]

--- .class #id 

## Model Analysis (continued)

### White wines

```
##           Reference
## Prediction poor standard great
##   poor        6        3     0
##   standard   47     1052   162
##   great       1       41   156
```
Accuracy 95% confidence interval is [0.8066, 0.846]
