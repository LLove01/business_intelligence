DROP DATABASE IF EXISTS Sales;
CREATE DATABASE IF NOT EXISTS Sales;

# Use sales as the default database for next statements
USE Sales;

# Creating a table
DROP TABLE IF EXISTS test_table;
CREATE TABLE test_table(
	test_field DECIMAL(5,3)
);

# select statement
SELECT * FROM test_table;

# insert one value
INSERT test_table(test_field) VALUES(10.5);
SELECT * FROM test_table;

# insert multiple values
INSERT test_table(test_field) 
VALUES (12.555), 
		(14.555);
SELECT * FROM test_table;

# deleting records
DELETE FROM test_table 
WHERE
    test_field = 12.555;
SELECT * FROM test_table;

# good practice style (ctrl+B)
CREATE TABLE IF NOT EXISTS test (
    numbers 	INT(10),
    words 		VARCHAR(10)
);