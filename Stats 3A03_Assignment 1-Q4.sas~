*Import of data;
PROC IMPORT datafile='/folders/myfolders/sales.csv'
	out=sales
	dbms=csv replace;
run;
Proc Print Data=work.sales;
run;
*question a) Correlation between two variables;
PROC CORR DATA=work.sales;
	VAR newspaper;
	with sales;
run;
*question b) Scatterplot;
PROC SGPLOT DATA=work.sales;
	title "Scatterplot: Sales, question b";
	scatter y=sales x=newspaper;
run;

*question c) Linear Regression model appropriate?
*show the scatter plot
*hypothesis test for correlation coefficent 
*Based on the correlation between newspaper and sales, there is a weak correlation between the two variables, and based on the scatter plot the points are very scattered so I believe a linear regression model isn't appropiate for this data

*question d) Linear regression model defined;
* β_0 = newspaper
* β_1 = sales

*question e) Least squares regression line;
PROC SGPLOT DATA=work.sales;
	title "Scatterplot: Sales";
	reg y=sales x=newspaper;
run;
*question f) Hypothesis testing;
* Null: r = 0 
* Alternative r =/ 0
*As seen in part a), it was seen that the correlation between newspaper and sales has a p-value of 0.0011, which is safe for us to reject the null hypothesis.