# Grades Summary Statistics
Stata program that calculates summary statistics of class grades and creates a histogram for each test question

The list of grades must be in comma-delimited format and saved as a csv file. Once the grades are in proper format, run calculate_grades.do in Stata. To calculate the summary statistics and create histograms of the grades (for each question), execute 

> grade_stats "PATH_TO_GRADE_LIST" "grades_data.csv" 10

in Stata's command line. grades_data.csv is a sample list of grades to test the code. 10 is for the number of bins of the histograms.
