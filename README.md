# Grades Summary Statistics
Stata program that calculates summary statistics of class grades and creates a histogram for each test question

The program uses the outreg2 package.

The list of grades must be in comma-delimited format and saved as a csv file---see the sample grades data, grades_data.csv. Note that there are no student number---the script cannot distinguish between student numbers and grades. Also, you can have as many grades columns as you like in the csv file. 

Once the grades are in proper format, run calculate_grades.do in Stata to initiate the program. Then, to calculate the summary statistics and create histograms of the grades (for each question), execute 

> grade_stats "PATH_TO_GRADE_LIST" "grades_data.csv" 10

in Stata's command line. 10 is for the number of bins of the histograms. The output will be saved in the folder in PATH_TO_GRADE_LIST.

The table created will look like this

![alt text][table]

In the table, **sd** is the standard deviation and **p#** is the #-th percentile.


TO DO:
- add notes for table headings
- improve table headings

[table]: https://github.com/palpen/grades_sum_stats/blob/master/sample_table.png
