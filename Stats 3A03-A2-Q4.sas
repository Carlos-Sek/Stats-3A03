*Import of data;
PROC IMPORT datafile='/folders/myfolders/cigarette.csv'
	out=cigarette
	dbms=csv replace;
run;

*(a) Calculate the least squares regression line for the model of interest. Be sure to define any variables you introduce.;
*GPA = 83.43938 + 5.47992 x Age_i -2.95246 X Price_i
*Code is used in (b)

*(b) Calculate a 99% confidence interval for β2.;
proc reg data=work.cigarette (keep=Sales Age Price) plots=none;
model Sales= Age Price/CLB alpha=0.01;
output out=predict 
predicted=fitted_value
LCL=lower_PI
UCL=upper_PI
LCLM=lower_CI
UCLM=upper_CI;
*CI: (-5.75141	-0.15350)
*(c) Use the model to estimate the average cigarette sales for a median age of 30 and an average cigarette pack price of $38. Calculate the corresponding 95% confidence interval.;
* CI: (121.268	150.020)
* Code is used in (d)

*(d) Use the model to predict the cigarette sales per capita corresponding to a new state with a median age of 30 and average cigarette pack price of $38. Calculate the corresponding 95% prediction interval.;
data new;
input Age Price;
datalines;
30 38
;
data combined;
set new cigarette;
proc reg data=work.combined;
	model Sales = Age Price/ cli;
*	output out=salespredict(where(Sales=.));
run;
* PI: (74.5844	196.7028);
PROC REG Data=work.combined plots=none /*noprint*/;
Model Sales= Age Price /* Changes alpha */;
OUTPUT Out=CigarettePred(where=(Sales=.)) /* selects the one row */
	Predicted=Pred
   LCLM=LowerCI /* Confidence intervals */
   UCLM=UpperCI
   LCL=LowerPI /* Prediction interval */
   UCL=UpperPI;
run;
Proc print data=CigarettePred;
title 'Predicted value and intervals';
run;
