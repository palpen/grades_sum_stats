/*
Description: calculation summary statistics of class grades

inputs:
- path_to_folder 
- name_of_grade_file 
- number_for_histogram_bins

output:
- tif files of histograms
- xml file for excel
- word
- text file

notes:
- program needs to know which column contain the grades
- need to distinguish between grades column and student number column (hard code names)
- grades data has to be as a csv file
- needs outreg2

to do:
- 

techniques:
- !_rc means _rc is 0---! reverses the condition from _rc == 1 to _rc == 0
*/

capture program drop grade_stats

program define grade_stats

	display "`1'"
	insheet using "`1'/`2'", comma // path to grades as csv file

	display "iterating over varlist of `1'"
	
	local grade_vars

	foreach x of varlist _all {

		// check variable type
		capture confirm numeric variable `x'

		if !_rc {

			display "`x' is numeric"
			local grade_vars `grade_vars' `x'  // save numeric (grade) variables only

		}
		else {

			display "`x' is a string"
		
		}

	}

	display "`grade_vars'"

	// calculate summary statistics
	outreg2 using "`1'/grade_statistics", replace sum(detail) keep(`grade_vars') eqkeep(N mean sd min max p1 p5 p10 p25 p50 p75 p90 p95 p99) excel word

	// create histograms
	foreach g of local grade_vars {

		hist `g', bin(`3')
		graph export "`1'/`g'.tif", replace

	}

end

// test
clear
set more off
grade_stats "/Users/palermospenano/Desktop/Dropbox/temporary/grades_stats" "grades_data.csv" 10


//end