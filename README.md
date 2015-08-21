Hair Salon Code Review

This application is a demonstration application designed to show classes, tests, views with Sinatra and SQL.

Technologies Used
Application: Ruby, Sinatra
Testing: Rspec, Capybara
Database: Postgres

Installation

Install hair_salon by first cloning the repository.

  $ git clone https://github.com/Rugbyman21/hair_salon.git

Install required gems:

  $ bundle

In psql:

  CREATE DATABASE hair_salon;
  CREATE TABLE client (id serial PRIMARY KEY, name varchar);
  CREATE TABLE stylist (client_id serial PRIMARY KEY, description varchar);

Start the webserver:

  $ ruby app.rb

Navigate to: localhost:4567 in the browser.

License
Copyright 2015 
