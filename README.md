# neo4j

## Linux

```
cd
docker run -d --publish=7474:7474 --publish=7687:7687  --volume=$HOME/neo4j/data:/data  neo4j:3.5.11
```