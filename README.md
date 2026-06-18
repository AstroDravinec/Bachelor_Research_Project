# Bachelor_Research_Project
This repository contains all code used for data analysis of a physics bachelor final research project: "Real-Time Modeling of a PEMFC Using Equivalent Circuits".
The project itself can be found here: https://typst.app/project/rYVoOuB1pKVHM4XgjhhVXE

## Raw data
The raw data folder contains all the data collected in the lab, using the setup described in the methods; figure 6. 

## Data Acquisition
The data acquisition folder contains all the code used to acquire the data desired, as well as the code used for live plotting of the results. 
Various adafruit libraries in python were used for communication between the sensors and the Raspberry Pi 5.

## Data Analysis
The data analysis folder contains the code used to analyze the data. It is divided into 3 sections:
1. Current Switching; used to determine R_ohm and C_act
2. Bayesian Inferrence: used to infer parameters a,b, and c
3. Model Validation: used to generate all plots found in the report
