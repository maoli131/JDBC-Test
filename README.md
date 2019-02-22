# TEST JDBC with LARGE Flights Data
### Author: M. L, Yilin X

This Git repository consists of a VERY large flight datasets to test JDBC assignment.
The flights data comes from [here](http://www.cs.washington.edu/education/courses/cse344/flights-small.tar.gz). 
Yet, in this test we only used flight.csv from the package. Here are in total 1,148,675 rows of airline information 
and after matching to our assignment's format, we are left with 9,552 rows. 

To test, there are two ways.

- Method 1: the simpler way:

    1. Load the test.db into your sqlite3 by running sqlite3 test.db; then change your PA2.java's 
    connection to the test.db. 

    2. Then you can run you PA2.java and check your results against the "solution" table
    

- Method 2: the original way:

    1. Download the flights-small.tar.gz from the link provided above. Unzip and store the flighs-small.csv in
       your working directory.  

    2. Run first two lines of largeFlight.sql. By doing so, you create a empty table named flight-data.

    3. Import all data from the flights-small.csv to the table we created. 
    In terminal, run sqlite3 test.db; .mode csv; .import flights-small.csv flight_data

    4. Create our own flight table with only Airline, Origin, Destination. 
    To do so, run the rest 3 lines of largeFlight.sql.

    5. Run your PA2.java to get result and store it in "connection".

    6. To check your answer, load solution.csv into your database as a "solution" table. And check diff.

    7. Also you can output the Connected table to a csv file named your_solu.sql.
    In terminal, run sqlite3 pa2.db; .mode csv; .headers on; .output your_solu.sql; SELECT * FROM connected;
    
#### Reminder: 
- `test_filtered.db` does NOT contain all the rows in flights_small.tar.gz, the data is filtered.
- There are a few tables in the `test_filtered.db`.
    1. **Flight** - contains approximately 1,000,000 rows of data of the same format as the given input.
    2. **final** - the solution set.
    
#### Test your PA2.java on `test_filtered.db`:
- Download the test database.
- Change `conn = DriverManager.getConnection("jdbc:sqlite:pa2.db");` to `conn = DriverManager.getConnection("jdbc:sqlite:test_filtered.db");`
- Run your code and execute the following SQL commands.
    ```SQL
    SELECT * FROM (
    SELECT * FROM Connected EXCEPT
    SELECT * FROM final)
    UNION ALL
    SELECT * FROM (
    SELECT * FROM final EXCEPT
    SELECT * FROM Connected);
    ```
- If you see an empty output, then your answer is the same as ours.
