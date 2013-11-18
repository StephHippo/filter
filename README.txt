						        Filter
						            |
		____________________________|______________________________________________
		|		|	            |	       			      |                        |
		|		|	            |   				ScalarLinearFilter      FilterCascade
		|		|	            |			     	       |
MaxFilter	   MinFilter	ArithmeticMeanFilter		FIRFilter
									                        |
									                BinomialFilter


Originally had MaxFilter, MinFilter, and ArithmeticMeanFilter inheriting from ScalarFilter,
however it was no different than the Filter class so removed because it was extraneous and made the abstraction confusing as there was no longer a distinction between a Filter and a ScalarFilter.

Filter
     Optional n parameter allows users to specify if we're only checking the last N values of input

     reset(reset_in_val, reset_out_va)
     reset values were allowed to be optional because in some cases we just want to clear the input and output arrays

     input_value(input)

     get_output(input)
     allowed the user to pass in a block for special output calculations (like in ScalarLinear)

     relevant_values
     encapsulates code that checks for an n value


MaxFilter
    get_output
    passes the block in that finds the array max for code encapsulation

MinFilter
    get_output
    passes the block in that finds the array min for code encapsulation

ArithmeticMeanFilter
    get_output
    passes the average routine for code encapsulation

ScalarLinearFilter

    get_output
    overrides get_output because we need y_i

    multiply_each_by_param(arr, params_arr)
    multiplies each param by its input and sums the total


    multiply_each_by_param(arr, param_arr)
	chose to assert that the arrays must be equal in the case that we lose a parameter value. Any values that are “missing” should have been filled in with 0’s.

    get_last_z_values(z, value_array)
	chose to reverse the array and then grab the appropriate values in order to make
appending “missing” parameters to the array easier. I reverse it in both blocks of the if
statement for consistency. Because get_last_z_values is private and only reads from the value_array and does not write to it, I passed the value in as the output array. For additional safety, values of the inputs are cloned so we are not passing the direct private field of inputs or outputs.


FIRFilter
chose to leave this as its own class to make it clear that the user only needs to pass in a gain

BinomialFilter
    update_input_params
    hid the implementation details of the update

    binomial_value
    hid the details of finding the binomial value

    monkeypatched the factorial method as part of Fixnum

FilterCascade
    an ordered collection of filters

    add_filter(filter)
    asserts that the input must be a filter

    reset
    resets each filter individually only if th particular filter responds to it

    cascade
    if there are no filters, just returns the cascade_input


