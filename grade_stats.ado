
capture program drop grade_stats

program define grade_stats

	args grades_csv hist_bin

	clear
	set more off

	version 13.1

	pwd

	insheet using "`grades_csv'", comma

	// save  numeric variables to a local macro
	ds, not(type string)
	local grade_vars `r(varlist)'
	ds, has(type string)
	local string_vars `r(varlist)'

	display as result `"The variables `: subinstr local grade_vars `" "' `", "', all' are numeric  And "' _n `"The variables `: subinstr local string_vars `" "' `", "', all' are string variables"'

	// calculate summary statistics
	qui outreg2 using grade_statistics, replace sum(detail) keep(`grade_vars') eqkeep(N mean sd min max p1 p5 p10 p25 p50 p75 p90 p95 p99) excel word

	// create histograms
	foreach g of local grade_vars {

		hist `g', bin(`hist_bin')
		graph export "`g'.tif", replace

	}

	clear

end

/*
SAMPLE:

// Counts the number of observations in between range of values

sysuse auto, clear

local grade_interval "15906 13466 11385 6342 5006 4195 3895 3748"
local n: word count `grade_interval'
local n_min1 = `n' - 1

forvalues i = 1/`n_min1' {

  local a: word `i' of `grade_interval'
  local next = `i' + 1
  local b: word `next' of `grade_interval'

  display "`b' to `a'"
  count if inrange(price, `b', `a')

}

*/


//end
