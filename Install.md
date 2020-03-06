# Install Neo4j

## Neo4j with Docker (Linux)

```
cd
docker run -d --publish=7474:7474 --publish=7687:7687  --volume=$HOME/neo4j/data:/data  neo4j:3.5.11
```

## Neo4j with Vagrant
```
vagrant up
```

## Access Neo4j

http://localhost:7474
