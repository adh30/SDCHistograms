{smcl}
{* 6august2023}{...}
{hline}
help for {hi:binsafe}
{hline}

{title:Equal probability histogram with no area < 10 for SDC} 

{p 4 14 2} 
{cmd:binsafe} 
{it: varname} 
[{it:weight}]
[{cmd:if} {it:exp}] 
[{cmd:in} {it:range}]
[  
{cmd:,}
{cmd:bin(}{it:#}{cmd:)}
{cmd:mean} 
{cmd:plot(}{it:plot}{cmd:)}
{it:graph_options}
]


{title:Description}

{p 4 4 2}
{cmd:binsafe} shows a histogram of the distribution of {it:varname} 
constructed so that each bar represents the same fraction of the data. No fraction contains fewer than 10 observations to accord with Statistical Disclosure Control (SDC) rules. If bin area >10 then the bin number is assigned using Sturges' rule.

{p 4 4 2}{cmd:fweight}s and {cmd:aweight}s may be specified. 


{title:Remarks} 

{p 4 4 2}As an example, suppose we calculate the minimum, the lower 
quartile, the median, the upper quartile and the maximum of a variable.
These 5 quantiles allow us to draw a histogram with 4 bars, each 
representing 1/4 of the total (possibly weighted) frequency, or of 
the total probability 1. The height of each bar representing the average 
probability density in each interval should be 1 / 4 * (higher quantile 
- lower quantile). More generally, {it:k} bars each representing a fraction 
or probability 1/{it:k} may be drawn after calculating {it:k} +1 
quantiles equally spaced in terms of cumulative probability. 
In practice, the lowest and highest of these are obtained 
from {help summarize} and the others from {help _pctile}. 

{p 4 4 2}{cmd:binsafe} refuses to draw graphs when the quantiles 
calculated are not distinct. This is likely with categorical or discrete 
or highly rounded data, especially as the number of quantiles approaches
the number of values. It is recommended either to ask for fewer bins 
or to reconsider the appropriateness of the request. 

{p 4 4 2}Equal probability histograms have some analytical value. Perhaps 
their greatest merit is pedagogic, as examples showing the principle behind 
histograms, that area represents probability, and as a graphic way to show 
how quantiles relate to the histogram, especially say quartiles, octiles or 
deciles. 

{p 4 4 2}Note that {cmd:binsafe} is not implemented using 
{help histogram}, but directly. 
  
{p 4 4 2}This kind of graph has been discussed by, for example, 
Breiman (1973, pp.208-9) and Scott (1992, pp.69-70). 
Breiman points out that the associated error will be approximately a constant
multiple of the bar heights, so long as the bin frequencies are not too small.
Scott points out that, in terms of mean integrated squared error,
it is a lousy estimator of the underlying probability density function. 
Simonoff (1996, p.34) gives references for related work from 1969. 
(Please email the author with details of any earlier or fuller discussions.) 
 

{title:Options} 

{p 4 8 2}{cmd:bin()} indicates the number of bins. 
In Stata 8.0, the number of bins may not exceed 20. 
As of Stata 8.1, the number of bins may not exceed 1000. 
The default is 8.

{p 4 8 2}{cmd:mean} adds a dashed line indicating the mean of the data. 

{p 4 8 2}
{cmd:plot(}{it:plot}{cmd:)} provides a way to add other plots to the generated
graph; see help {help plot_option}.

{p 4 8 2}{it:graph_options} refers to options of 
{help twoway_bar:twoway bar}. 


{title:Examples}

{p 4 8 2}{inp:. sysuse auto}

{p 4 8 2}{inp:. binsafe price}{p_end}
{p 4 8 2}{inp:. binsafe price, bin(4)}{p_end}
{p 4 8 2}{inp:. binsafe price, bin(10) plot(kdensity price)} 

{p 4 8 2}{inp:. webuse lbw}

{p 4 8 2}{inp:. binsafe lwt}{p_end}
{p 4 8 2}{inp:. binsafe lwt, bin(4)}{p_end}
{p 4 8 2}{inp:. binsafe lwt, plot(kdensity lwt)} {p_end}
{p 4 8 2}{inp:. binsafe lwt, bin(10) plot(kdensity lwt)} {p_end}

{title:Author}

        Alun Hughes, UCL, 
	alun.hughes@ucl.ac.uk
		
	 
{title:Acknowledgements} 

{p 8 8}This code is a minor modification of {cmd:eqprhistogram} by Nick Cox (n.j.cox@durham.ac.uk). 


{title:References}

{p 4 4 2} 
Breiman, L. 1973. {it:Statistics: with a view towards applications.} 
Boston: Houghton Mifflin. 
 
{p 4 4 2}  
Scott, D.W. 1992. 
{it:Multivariate density estimation: theory, practice, and visualization.} 
New York: John Wiley. 

{p 4 4 2}
Simonoff, J.S. 1996. 
{it:Smoothing methods in statistics.} New York: Springer. 

{p 4 4 2}
Sturges, H.A. 1926.
{it:The choice of a class interval.} J Am Stat Assoc 21:65–66.


{title:Also see}

{p 0 19}On-line:  help for {help histogram}{p_end}
