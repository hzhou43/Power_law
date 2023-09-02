# Power_law

f77 plaw_ran.f ran1.f -o plaw.x
plaw_ran.run generates data according to a power law distrinution and then calculates x^max and the corresponding SD 

plaw+tail.f is similar to plaw_ran.f, but the distribution funciton has an exponential tail connected to the power law.

f77 minmax.f -o minmax.x
minmax.run geberates x^max and the corresponding SD for a pre-generated data set. The number of data points in the set 
is 10000. The set is divided into M samples of size N; N ranges from 10 to 1000, and M = 10000/N.

If you use any file in this repository or a portion thereof, please cite:

H.-X. Zhou (2023). Power law in a bounded range: Estimating the lower and upper bounds from sample data. J. Chem. Phys. 158, 191103
