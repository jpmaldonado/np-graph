// Create test database
// Use MERGE to create nodes, MATCH for replace

WITH "https://github.com/jpmaldonado/np-graph/raw/master/data/mcauley2012/facebook_combined.txt" AS uri 
LOAD CSV FROM uri AS row
WITH toInteger(split(row[0],' ')[0]) as a, toInteger(split(row[0],' ')[1]) as b
MERGE (m1:Member {memberId: a})
MERGE (m2:Member {memberId: b})
MERGE (m1)-[rel:IS_FRIEND]->(m2)
