# Pewlett-Hackard-Analysis
## Project Overview
For this analysis we were tasked with creating summary data of potential retiries for Pewlett Hackards aging workforce.  This data will be used as PH plans for how many positions they will need to fill as well as 
## PNG of the ERD (original 6 DB's)
![PNGERD](https://github.com/RudyR32/Pewlett-Hackard-Analysis/blob/master/Pictures/EmployeeDB.png)
## Challenge Summary
Presents a cohesive written
report that includes the
following:
Summary of the results
✓ number of individuals retiring
✓ number of individuals being
hired
✓ number of individuals
available for mentorship role
Additionally, the summary
should include
✓ one recommendation for
further analysis on this data set

Number of Individuals Retiring: 41,380<br/>
This number is based off of the the parameters that the employees were born between Jan 1, 1952 and Dec 31, 1955 as well as being hired between Jan 1, 1985 and Dec 31, 1988.  These are the parameters given in the module for who would be retiring.<br/>
Number of Individuals Being Hired: 39,831<br/>
This is calculated by subtracting the number of people retiring by the number of people in the mentorship program.<br/>
Note: This number is not in reality guarenteed to be true.  There are a number of factors that would contribute to this such as the number of people who actually retire, the number of people who participate in the mentorship program and not the least of which PH's people strategy going forward.  It is not unreasonable to think that a company with thousands of employees would not fill every position where someone left or would be hiring for new positions.  I would imagine that the number of employees they have fluctuates daily.
Number of Individuals Availible for Mentorship Role: 1549<br/>
This number comes from the final peice of part 1 of the challenge.  The parameter here as defined in the challenge is that the employee was born in the year 1965 and that they were a current employee.  We did also remove duplicate records for people who had held more than one position, although this was also accomplished in only looking at records that ran through the current date.
## Code created during Analysis
[Challenge](https://github.com/RudyR32/Pewlett-Hackard-Analysis/blob/master/Queries/challenge.sql)<br/>
[Schema](https://github.com/RudyR32/Pewlett-Hackard-Analysis/blob/master/Queries/schema.sql)<br/>
[Queries](https://github.com/RudyR32/Pewlett-Hackard-Analysis/blob/master/Queries/queries.sql)
