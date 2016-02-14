# Grades Summary Statistics

### Description

A Stata program that calculates various summary statistics and creates histograms for grades of each test question.

### Required Package

outreg2

### Instruction

The list of grades must be in comma-delimited format and saved as a csv file---see the sample grades data, grades_data.csv. Note that there are no columns for the student numbers/id---the script at present cannot distinguish between student numbers and grades. Also, there are no limits to the number of grade columns in the csv file.

Once the grades are in their proper format and calculate_grades.ado is saved in the current working directory, run the script by entering

> grade_stats grades_data.csv 10

in Stata's command line. 10 is for the number of bins of the histograms. The output will be saved in the folder in PATH_TO_GRADE_LIST.

The table created will look similar to the figure below

![alt text][table]

In the table, **sd** is the standard deviation and **p#** is the #-th percentile.

To make the program available to all projects, save calculate_grades.ado in your personal ado directory, which you can find by running `sysdir` in Stata's command line.

### To Do

- convert grades to percentage format
- add count between grade intervals
- add notes for table headings
- improve table headings

[table]: https://github.com/palpen/grades_sum_stats/blob/master/sample_table.png
