### Project5 Neo4j
### Nathan Lim (Seoungyoon Lim)

### 1. A high-level description of the recommendation system
Ebay, Walmart and many other big retailers are using real time recommendation system. This system monitors their customers' buying pattern, analyze the product they are interested in. So that it can expand their profit.

### 2. A description of the data model
- nodes: products, customers
- relationships: bought, looking, knowing
- attributes: products_id, product page staying time, 

### 3. A small sample of data

 I made fictional data including products, customers and their relationships. These data have customers and products information that the customers are interested in or already bought.
 
 https://raw.githubusercontent.com/nathanlim45/IS607/master/project5/customers.csv
 https://raw.githubusercontent.com/nathanlim45/IS607/master/project5/product.csv
 
### 4. The code for queries to acquire and manage the data in Neo4j
```
LOAD CSV WITH HEADERS FROM 
"file:/Users/seoungyoonlim/Documents/cuny/IS607/project5/customers.csv" as csvline
MERGE (c1:customer {customer_id: csvline.customer_id, firstname: csvline.givenname, lastname: csvline.surname})
```
```
LOAD CSV WITH HEADERS FROM 
"file:/Users/seoungyoonlim/Documents/cuny/IS607/project5/product.csv" as pro
MERGE (p1:product {product_id: pro.product_id, name:pro.name, price:pro.price})
```
```
LOAD CSV WITH HEADERS FROM 
"file:/Users/seoungyoonlim/Documents/cuny/IS607/project5/customers.csv" as csvline2
MATCH (c:customer{firstname: csvline2.givenname}),(p:product{name: csvline2.looking})
MERGE (c)-[:Interested_in{time: csvline2.staying_time}]->(p)
```
```
LOAD CSV WITH HEADERS FROM 
"file:/Users/seoungyoonlim/Documents/cuny/IS607/project5/customers.csv" as csvline2
MATCH (c:customer{firstname: csvline2.givenname}),(p:product{name: csvline2.bought})
MERGE (c)-[:bought]->(p)
```
```
LOAD CSV WITH HEADERS FROM 
"file:/Users/seoungyoonlim/Documents/cuny/IS607/project5/customers.csv" as csvline2
MATCH (c:customer{firstname: csvline2.givenname}),(k:customer{firstname: csvline2.knowing})
MERGE (c)-[:knowing]->(k)
```

```
match(n:customer)-[r]->(a:product) return n,r,a

```
![alt tag](https://raw.githubusercontent.com/nathanlim45/IS607/master/project5/graph1.png)


### 5. The code for queries to access and analyze the data for your use case 
```
match(c:customer)-[r]->(a:product{name:"IKEA Coffee table"}) return c,a,r
```
![alt tag](https://raw.githubusercontent.com/nathanlim45/IS607/master/project5/graph2.png)

Through the querie above, we can not only see who can be potential buyer of the Coffee table, but also see relationship between customers. We can also retrieve people who have similiar tastes for products and recommend them certain products. For example, the above case, we can send a discount coupon to Richard and Clarence for the coffee table, or send a review from Franklin who already bought the coffee table


