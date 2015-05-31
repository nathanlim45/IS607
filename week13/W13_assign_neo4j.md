### Assign13 Neo4j
### Nathan Lim (Seoungyoon Lim)

### 1. Load csv files into Neo4j
Clean database first
```
MATCH (a) optional MATCH (a)-[r]-() DELETE a,r
```

Load the students,the dormitory data and then create relation between the two.

```
LOAD CSV WITH HEADERS FROM 
"file:/Users/seoungyoonlim/Documents/cuny/IS607/week13/data-students-and-housing.csv" as csvline
MERGE (d1:dormitory {name: csvline.Dormitory})
MERGE (s1:student {firstname: csvline.GivenName, lastname: csvline.Surname, id: csvline.id, gender: csvline.Gender, addrress: csvline.StreetAddress, city: csvline.City, state: csvline.State, zipcode: csvline.ZipCode, phone: csvline.TelephoneNumber })
CREATE (s1)-[r:STAY_IN{room: csvline.Room}]->(d1)
```
```
match(n)-[r]-(m) return n,r,m
```
![alt tag](https://raw.githubusercontent.com/nathanlim45/IS607/master/week13/graph1.png)

Create courses
```
LOAD CSV WITH HEADERS FROM 
 "file:/Users/seoungyoonlim/Documents/cuny/IS607/week13/data-courses.csv" as csvline2
MERGE (c1:course {department: csvline2.CourseDept, number: csvline2.CourseNumber, title: csvline2.CourseName})
```
Create relations: Enrolled, IP
```
LOAD CSV WITH HEADERS FROM 
 "file:/Users/seoungyoonlim/Documents/cuny/IS607/week13/data-courses.csv" as csvline2
MATCH (s:student{firstname: csvline2.GivenName}),(c:course {number: csvline2.CourseNumber})
WHERE csvline2.Grade ="IP"
MERGE (s)-[:Enrolled{section: csvline2.Section, instructor: csvline2.Instructor, grade: csvline2.Grade}]->(c)
```
Create relations: Completed
```
LOAD CSV WITH HEADERS FROM 
 "file:/Users/seoungyoonlim/Documents/cuny/IS607/week13/data-courses.csv" as csvline2
MATCH (s:student{firstname: csvline2.GivenName}),(c:course {number: csvline2.CourseNumber})
WHERE NOT csvline2.Grade ="IP"
MERGE (s)-[:Completed{section: csvline2.Section, instructor: csvline2.Instructor, grade: csvline2.Grade}]->(c)
```
```
match(n:student)-[r]->(c:course) return n,r,c
```
![alt tag](https://raw.githubusercontent.com/nathanlim45/IS607/master/week13/graph2.png)

* * *
### 2. We can do the same thing by SQL. However, Graph database is more intuitive. We can easily see the connection between nodes and edges at a glance. 

* * *
### 3. Retrieve Richard's roomates

```
match(s1:student{firstname:"Richard"})-[r1:STAY_IN]->(dormitory),
(s2: student)-[r2:STAY_IN]->(dormitory)
return s1.firstname,s2.firstname,r1,r2
```
![alt tag](https://raw.githubusercontent.com/nathanlim45/IS607/master/week13/graph3.png)

* * *

### 4. Update Richard's relation to Math 120 Course
Before
```
match(s:student{firstname:"Richard"})-[r]->(c:course)
return s.firstname, c.title, r
```
![alt tag](https://raw.githubusercontent.com/nathanlim45/IS607/master/week13/graph4.png)

Update
```
match(s:student{firstname:"Richard"})-[r]->(c:course{number:"120"})
DELETE r
CREATE (s)-[r2:Completed{grade:"B"}]->(c)
return s.firstname, c.title, r2.grade, r2
```

After
```
match(s:student{firstname:"Richard"})-[r]->(c:course)
return s.firstname, c.title, r
```
![alt tag](https://raw.githubusercontent.com/nathanlim45/IS607/master/week13/graph5.png)


* * *
###BONUS Question
If we add instructor's nodes? Would it be better?

```
LOAD CSV WITH HEADERS FROM 
 "file:/Users/seoungyoonlim/Documents/cuny/IS607/week13/data-courses.csv" as tch
MERGE (i:instructors {name: tch.Instructor, dept: tch.CourseDept})
```
The possibility of changing of department is rare, though, the course that the instructor teaches can change, or we might want to add more information about the instructors. Adding instructor nodes can make this change easier, so that we can maintain the database better.

```
LOAD CSV WITH HEADERS FROM 
 "file:/Users/seoungyoonlim/Documents/cuny/IS607/week13/data-courses.csv" as tch2
MATCH (i:instructors {name: tch2.Instructor}),(c:course {number: tch2.CourseNumber})
MERGE (i)-[:teach_in{instructors: tch2.Instructor, name: tch2.CourseName, number:tch2.CourseNumber}]->(c)
```

Who teach what and whom
```
match(n:instructors)-[r]-(c:course)-[r2]-(s:student)  return n,r,r2,s
```
![alt tag](https://raw.githubusercontent.com/nathanlim45/IS607/master/week13/graph6.png)

* * *

###Conclusion

Graph database has definitely its own merit. It is very intuiative so that we can see some information that we coundn't see with table data. However, it is unfamiliar to do coding and query, since it has a different language, Cypher from SQL. In addition, in case that there are lots of nodes and relations, graphical information is harder to look at than table data. 


