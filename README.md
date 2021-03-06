# Pewlett-Hackard-Analysis
## Project Overview
For this analysis we were tasked with creating summary data of potential retiries for Pewlett Hackards aging workforce.  This data will be used as PH plans for how many positions they will need to fill.  In addition PH is planning on introducing a mentorship program and we have also preformed analysis to assist with identifying individuals who can participate.
## PNG of the ERD (original 6 DB's)
![PNGERD](https://github.com/RudyR32/Pewlett-Hackard-Analysis/blob/master/Pictures/EmployeeDB.png)
## Challenge Summary
For the challenge we were asked to preform the following analysis.  Calculate the number of individuals retiring, the number of individuals being hired and the number of individuals available for mentorship role below are my finding with a brief explanation of how I did so.<br/>

Number of Individuals Retiring: 41,380<br/>
This number is based off of the the parameters that the employees were born between Jan 1, 1952 and Dec 31, 1955 as well as being hired between Jan 1, 1985 and Dec 31, 1988.  These are the parameters given in the module for who would be retiring.<br/>
<br/>
Number of Individuals Being Hired: 39,831<br/>
This is calculated by subtracting the number of people retiring by the number of people in the mentorship program.<br/>
Note: This number is not in reality guarenteed to be true.  There are a number of factors that would contribute to this such as the number of people who actually retire, the number of people who participate in the mentorship program and not the least of which PH's people strategy going forward.  It is not unreasonable to think that a company with thousands of employees would not fill every position where someone left or would be hiring for new positions.  I would imagine that the number of employees they have fluctuates daily.<br/>
<br/>
Number of Individuals Availible for Mentorship Role: 1549<br/>
This number comes from the final peice of part 1 of the challenge.  The parameter here as defined in the challenge is that the employee was born in the year 1965 and that they were a current employee.  We did also remove duplicate records for people who had held more than one position, although this was also accomplished in only looking at records that ran through the current date.<br/>
## Recomendation for Additional Analysis on this Data Set
The next analysis I would preform on this data set would be to expanded the department level summaries that we preformed for Sales and Development.  With the size of this company it would be most likely that they do their people strategies at the Department Level so having this data broken down that way would assist with that.
## Tables Created for the Challenge
Below are snapshot of the 3 csv files that we were asked to create for the challenge.
#### Employees Grouped by Employee Number
![Employee_grouped_by_employee_number](https://github.com/RudyR32/Pewlett-Hackard-Analysis/blob/master/Pictures/Employees_grouped_by%20_emp_no.PNG)

#### Count of Retirement Aged Employees by Department
![Count of Employees Retirement Age by Title](https://github.com/RudyR32/Pewlett-Hackard-Analysis/blob/master/Employees_by_Title.PNG)

#### Potential Mentors 
![Potential Mentors](https://github.com/RudyR32/Pewlett-Hackard-Analysis/blob/master/Pictures/Potential_Mentors.PNG)
## Code created during Analysis
[Challenge](https://github.com/RudyR32/Pewlett-Hackard-Analysis/blob/master/Queries/challenge.sql)<br/>
[Schema](https://github.com/RudyR32/Pewlett-Hackard-Analysis/blob/master/Queries/schema.sql)<br/>
[Queries](https://github.com/RudyR32/Pewlett-Hackard-Analysis/blob/master/Queries/queries.sql)

## Additional Material
[CSV Files](https://github.com/RudyR32/Pewlett-Hackard-Analysis/tree/master/Data(.CSV%20files))
