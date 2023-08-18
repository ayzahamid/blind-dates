## Requisites
- Ruby version: 2.7.3
- Rails version: 7.0.7
- Database: Postgresql@14
-
# Local Setup

## Start docker DB Container
`docker-compose up db -d`

### After setting up DB container.
- docker exec -it blind-date-db-1 /bin/bash
  - psql -U postgres
      - DROP DATABASE blind_date_development;
      - CREATE DATABASE blind_date_development;
      - CREATE USER blind_date_user;
      - GRANT ALL PRIVILEGES ON DATABASE blind_date_development TO blind_date_user;
      - ALTER USER blind_date_user WITH superuser;
      - ALTER USER blind_date_user WITH PASSWORD 'password';
      - \q

Then `exit` from the container.

## Start docker WEB Container
`docker-compose up web`

You application will be up and running! :tada:

### Todo:
- The users who marked invite as maybe should be considered too.
- If a user updated the status to "No" that particular group can be regenerated in order to cater that.
- Instead of a leader selecting a restaurant. People can be added in groups based on their location preferences and similarly auto select the nearest restaurant.
