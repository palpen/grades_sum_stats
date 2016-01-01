# Grades Summary Statistics
A Stata program that calculates various summary statistics of the class grades and also creates a histogram for each test question.

The program uses the outreg2 package.

The list of grades must be in comma-delimited format and saved as a csv file---see the sample grades data, grades_data.csv. Note that there are no columns for the student numbers/id---the script at present cannot distinguish between student numbers and grades. Also, there is no limit to the number grade columns in the csv file.

Once the grades are in proper format, run calculate_grades.do in Stata to initiate the program. Following this, calculate the summary statistics and create histograms of the grades by executing

> grade_stats "PATH_TO_GRADE_LIST" "grades_data.csv" 10

in Stata's command line. 10 is for the number of bins of the histograms. The output will be saved in the folder in PATH_TO_GRADE_LIST.

The table created will look similar to the figure below

![alt text][table]

In the table, **sd** is the standard deviation and **p#** is the #-th percentile.

TO DO:
- add notes for table headings
- improve table headings

[table]: https://github.com/palpen/grades_sum_stats/blob/master/sample_table.png
