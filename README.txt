						        Filter
						            |
		____________________________|________________________________
		|		|	            |	       			                |
		|		|	            |   				            FeedbackFilter
MaxFilter	   MinFilter	ArithmeticMeanFilter		            |
		                                                   _________|________________
		                                                   |                        |
		                                             ScalarLinearFilter      FilterCascade
                                        	            |
		                                            FIRFilter
								                        |
								                   _____|_______
								                   |           |
									        BinomialFilter   GainFilter

Filter
Filters are assumed to not support reset and to not depend on previous outputs
All filters can have an optional n constraint that allows the filter to only operate on the last n inputs

MaxFilter
Unless there is an n constraint, the MaxFilter operates as a memoryless filter and does not store previous inputs
by comparing the current input to the current max, and updating if the input is higher
This allows the max filter to operate on an unlimited number of inputs

MinFilter
The Min filter, much like the max, operates in a memoryless fashion unless there is a specified n constraint
This allows the min filter to operate on an unlimited number of inputs

ArithmeticMeanFilter
The ArithmeticMeanFilter again only stores inputs if there is an N constraint
This allows the mean filter to operate on a large number of inputs, however it is susceptible to overflow
in the total field while calculating the average. If the value becomes too large for the computer to handle,
an error might be raised.

Feedback Filter
Feedback Filters additionally have an array for output storage.
The following Filters are implemented as types of feedback filters

ScalarLinearFilter
While previously the scalar linear inputs and outputs were stuffed with zeros to match the size of the parameter
to arrays, the m and n constraints now allow for better performance by saving the zero stuffing and zero calculations

FIRFilter
A FIR Filter remains a ScalarLinearFilter, but with no output parameters

GainFilter
A Gain Filter is a type of FIR Filter with a single, constant input parameter

BinomialFilter
Binomial Filters are a type of FIRFilter with dynamic output parameters
Output parameters are calculated in the binomial_value method
A Binomial and Factorial cache were added to the class to save time on calculations

monkeypatched the factorial method as part of Fixnum

FilterCascade
A FilterCascade is still an ordered collection of filters, with no reset.

Resettable
To get around Ruby's constraint of a single parent class in Inheritance, a Resettable module
was built to allow for the reset of inputs and outputs. Resettable's reset functio takes in
a reset value and an array, mapping or clearing the array accordingly. Parameter arrays can not be
reset because they are read-only.


