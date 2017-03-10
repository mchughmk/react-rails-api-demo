# React Rails API Demo

This is a project to demo a simple application with a React frontend and a Rails API backend.  The interface displays two drop-down boxes: one for countries and one for states.  On page load, it calls the API to obtain a list of countries and populate them in the country dropdown.  Upon change of the country selection, another API call happens to retreive the list of states/territories for that country.

## Local Setup

This project uses [Docker](https://www.docker.com/) and Docker Compose to setup two containers: one for the website and one for a Postgres database.  To get running, do the following:

        docker-compose run --rm web npm install
        docker-compose up -d db
        docker-compose run --rm web rails db:create
        docker-compose run --rm web rails db:migrate
        docker-compose run --rm web rails db:seed

After the first setup, running `docker-compose up -d` will run all necessary containers  in daemon mode.

## Running the Tests

We use [`rspec-rails`](https://github.com/rspec/rspec-rails) as our testing framework.  To run the tests, the database container must be running (`docker-compose up -d db`).  Once the database is running, issue the `bundle exec rspec` command against the web container in one of two ways:

1. Exec into a running web container and issue the command:
    
        docker exec -it reactrails_web_1 bash
        bundle exec rspec
    
    OR

2. Run as a one-off command in a temporary container based on the web configuration:

        docker-compose run --rm web bundle exec rspec