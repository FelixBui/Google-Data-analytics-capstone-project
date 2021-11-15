# Google-Data-analytics-capstone-project
## Cyclistic bike share

__Introduction__:

This is my version of Case Study 1 from the Data Analytics capstone project.
The following is a summary of the case study:
Cyclistic, a fictional bike-sharing firm, believes that increasing the number of annual members over casual riders is the key to future success. The marketing analyst teams want to know the following in order to develop a new marketing strategy aimed at converting casual riders into annual members:
- How do annual members and casual riders use Cyclistic bikes differently?
- Why would causal riders buy Cyclistic annual memberships?
- How can Cyclistic use digital media to influence casual riders to become members?

The director of marketing assign me to answer question 1, i’ll use six steps of data analysis i have learned in this course to answer the question

## ASK:

The marketing manager feels that converting casual riders to yearly riders will help the company reach its aim of faster growth in the future. To address the first question, I shall rely on data.
In order to provide next steps to the organization, the current goal is to evaluate the data and discover major behavioral distinctions between casual riders and yearly members.

## PREPARE:

The project's data is housed on Amazon Web Services (AWS) (Amazon Web services). I'm simply looking at the last 12 months of trip data, which starts in 2020-08 and ends in 2021-07. Motivate International Inc. has made the data available under this license after collecting it directly from Cyclistic. There is no personally identifying information in the data because it has been anonymised. While this will hinder analyses that look into the personal characteristics of individual riders, such as their history or where they live, there is still enough data to establish certain patterns.

## PROCESS:

The tools I'll be using in this step are Microsoft SQL Server, and Jupyter notebook.
I’ll cleaning my dataset and transform it to appropriate form for use
- Duplications
- Null data cells
- Misspelled words
- Mistyped numbers
- Mismatched data types
- Messy/Inconsistent strings
- Messy/Inconsistent date formats
- Misleading variable labels
- Business Logic

I used Jupyter notebook to quickly merged 12 dataset into 1

### Duplications:
I used MSSM to find the duplicated rows, I found that 189 is duplicated rows and removed it
### NULLS:
i used Jupyter notebook to detect null in each columns
Remove all rows containing NULL
### Misspelled words: no problem
### Mistyped numbers: no problem
### Mismatched data types:
Change the datatype of column “started_at” and “ended_at” to “datetime” using the CAST function.
### Messy/Inconsistent strings: Columns “start_station_name” and “end_station_name” contain blank value. Remove rows containing it.
### Messy/Inconsistent date formats: no problem
### Misleading variable labels: 
Variable “member casual” and “rideable_type” is confusing, change it into “user_type” and “bike_type”.
### Business logic: 
Will remove columns start_lat, start_lng, eng_lat, eng_lng since they are not used in analysis.

Finally, i used MSSM to extract the final dataset for analyzing, the SQL script can be found [here](https://github.com/FelixBui/Google-Data-analytics-capstone-project/blob/main/SQLQuery7.sql)
## ANALYZE
I use analysis tools, mainly Jupyter Notebook and Python. Detailed analysis can be viewed [here](https://github.com/FelixBui/Google-Data-analytics-capstone-project/blob/main/Cyclistic.ipynb)
## ACT
#### My Recommendations
The data provided is still insufficient to confirm the hypotheses. But based on that we can make some suggestions for the time being.
- Special promotion for customers who are members on weekends, discount based on rental hours...
- Strengthen bicycle rental points at some famous tourist spots to attract tourists.
- Reduce the number of docked_bike rentals, increase the number of electric_bikes. If there is a problem with inventory, additional benefits for customers members can freely choose the type of bike they want. The number of classic_bike rentals can be slightly increased in November and December to serve loyal customers

