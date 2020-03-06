MATCH (n) DETACH DELETE n;


CREATE (nicole:Person {name:'Nicole', age:24})
CREATE (drew:Person {name:'Drew', age:20})

CREATE (mtdew:Drink {name:'Mountain Dew', calories:9000})
CREATE (cokezero:Drink {name:'Coke Zero', calories:0})

CREATE (coke:Manufacturer {name:'Coca Cola'})
CREATE (pepsi:Manufacturer {name:'Pepsi'})

MERGE (charlie:Person { name: 'Charlie Sheen', age: 10 })

CREATE
(nicole)-[:LIKES]->(cokezero),
(nicole)-[:LIKES]->(mtdew),
(drew)-[:LIKES]->(mtdew),
(coke)-[:MAKES]->(cokezero),
(pepsi)-[:MAKES]->(mtdew),
 (charlie)-[:BROTHER]->(nicole)


MATCH (a)-[]->(b) 
RETURN a,  b 
LIMIT 10

MATCH (a)<-[r]-(b) 
RETURN a, type(r), b 
LIMIT 10

MATCH (n)-[r:MAKES]->(m)
    RETURN n, r, m
	
MATCH (person:Person)-[r:LIKES]->(drink:Drink)
RETURN person.name AS name, drink.name AS drink

MATCH (p:Person)-[:LIKES]->(drink:Drink)
WHERE p.name = "Nicole"
RETURN p.name AS name, AVG(drink.calories) AS avg_calories

MATCH (person:Person)-[:LIKES]->(drink:Drink)
RETURN person.name, drink.name, drink.calories

MATCH (n:Person)-[r]-() 
RETURN n.name, count(r) as relations
ORDER BY relations DESC

MATCH (n:Person { name:'Charlie Sheen'}),(m:Person { name:'Drew' })
WITH n, m
MATCH p = shortestPath((n)-[*..6]-(m))
RETURN p


CREATE (Firefox:Internet_Explorer)

MATCH (n:Internet_Explorer)
DELETE n
