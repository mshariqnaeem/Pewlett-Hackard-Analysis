# Pewlett-Hackard-Analysis

## Overview of Analysis

During this module Bobby learned how to use SQL to pull data from different tables and how to create new tables using SQL and POSTGRES SQL.\
After completing the module Bobby's manager has asked us to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorhsip program for Pewlett-Hackard.

We will do this by using the skills learned in the module and actively implement the learned knowledge to show the requested results:

**1.** determine number of employees retiring per title so that the positions can be filled\
**2.** Create tables for Mentorship_Eligibility and retiring employees by title\
**3.** Export data into CSV files from SQL tables

### Purpose

The purpose of this Challenge assignment is for us to use the learned SQL skills and actively use them to create new tables and show these results through our analysis. This way we can use SQL and Postgres in the future for our own projects no matter the size of the database we are pulling the data from.

## Results

### Creation of tables for Analysis

As mentioned in the instructions for this assignment we were asked to create a retirement_titles table to find the total retiring employees by title.
This was done using the following code in the Employee_Database_Challenge query file

![retirement_tables code](https://user-images.githubusercontent.com/92459399/146657250-a15aa4b2-3373-4c10-81b7-8651ff78614c.PNG)

When we display the table of the code above using the "FROM * TABLE" method we get the following result. We then exported this result to a CSV file.

![retirement_table](https://user-images.githubusercontent.com/92459399/146657279-307370dd-b1c9-4db5-a990-3e1125d65c0e.PNG)

We proceeded to create further tables for unique_titles and used the DISTINCT ON statement to retrieve the first occurrence of the employee number. We then used the INTO clause to create new tables which were then exported into csv files. an example is shown below.

![unique_titles code](https://user-images.githubusercontent.com/92459399/146657408-45b2b0aa-0bb5-474f-bfad-448accc80bee.PNG)

![unique_titles](https://user-images.githubusercontent.com/92459399/146657409-946ca8f9-064c-4cf8-b7ca-9c1f61e7b4fc.PNG)

We created a table using similar steps named retiring_titles to find the number of employees retiring with cerain titles.

![retiring_titles](https://user-images.githubusercontent.com/92459399/146657580-ef59a370-5a27-4018-b982-f161a82a8c87.PNG)

Finally we were asked to create a Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965 which we have displayed below.

![mentorship_eligibility](https://user-images.githubusercontent.com/92459399/146657675-d4e61e72-3421-4ece-af0a-53d03a5ba4e0.PNG)

### Further Analysis of data


All of the queries for the tables displayed above can be found in the Employee_Database_challenge file.

## Summary

from the mentorship_eligibility table and the retiring_titles table we can find out all of the employees who are retiring by title and are eligible for he mentorship program.\
There is one issue to this however, which is that there is still a lot of information to go through in the tables.

We create a further table to count the number of employees

We were asked to provide additional tables that would show how many roles will need to be filled as the Silver Tsunami begins to make an impact on Pewlett Hackard.

We create multiple new tables to determine wthe amount of people who will be retiring in a table called **retireing_titles_still_working**. the total number of employees retiring comes out to 72,458.

![retiring_titles_still_working](https://user-images.githubusercontent.com/92459399/146657909-c70c5c84-1cb7-423b-adee-524da0b900d8.PNG)

We also created a table to find the employees currently working in the table **employees_currently_working**. When we use the count function to find the total number of employees for Pewlett-Hackard is 240,124. 

This means that out of 240,124 **Total Employees** 72,458 are born between 1952 and 1955 and eligible for retirement. this amounts to roughly 30.17% of the employees at Pewlett-Hackard. 

If these people were to retire immediately it would be a huge loss for Pewlett-Hackard especially with the Silver Tsunami set to hit soon. The **Mentoring Program** however allows retiring employees to work in a capacity where they will be working part-time hours to help mentor new employees. This avoids the issue of newer employees coming in with very little support, which Pewlett-Hackard has a huge selection of people to choose from.
