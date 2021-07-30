# Acesso | Bankly Technical Project
 
## Bank Account Transfer Micro-Service Based System.

## Objective

Development of an API to transfer funds between two accounts.

### Must Have
 - Endpoint for consulting transfer orders and their status.
 - Logs between every operations (Retrieving and creating transfer orders).

### How to run

1. Navigate to project root folder.

2. Run the command (needs docker and docker-compose installed).

```bash
    docker-compose up -d
```

3. navigate to '/src' folder

4. Run the command 

```bash
    dotnet watch run 
    # Or in case of no need debug
    dotnet run
```

5. Access SwaggerUI at https://localhost:5001/swagger to visualize endpoints.

#### Remarks  

  - For Showcase purposes the configuration for  rabbitmq and postgresql are all in appsettings.Development.json since the app by this moment is not intended to be published.
  - All tables will be created at the app startup moment.
  - Adminer can be accessed at http://localhost:8080.
  - PostgreSQL is exposed at default port 5432.
  - Api-conta is hosted at http//localhost:1000.
  - Logs can be seen in postgres default db schema 'public'.

 
