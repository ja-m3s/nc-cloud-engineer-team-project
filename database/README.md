How to build the database locally:

Inside folder database/ run:

docker build -t database .

How to run the database locally:

docker run -e POSTGRES_PASSWORD=password -p5432:5432 -t database

The port it runs on is 5432 and can be accessed in a local Docker instance at localhost:5432

To access local database run:
psql -h localhost -p5432 -U postgres
