# State Parks

#### An API project that holds states and associated parks(Fake parks; named after mountains).

#### By Geof Rosenmund

## Technologies Used

* Ruby
* Rails
* RSPEC
* Pry 
* PostgreSQL
* Faker
* FactoryBot
* Swagger-docs
* Swagger UI

## Description
This project is an API with Faker generated data. It has full CRUD functionality for the nested routes of states and parks. Routes are detailed below.

## Setup/Installation Requirements

Follow the subsequent instructions to work from Git Hub:

* Clone repository from Github
* Navigate to the top level of the project directory
* To create the Gemfile.lock: $ bundle install
* In order to recreate, seed, and set up the API documentation, run the following commands in your terminal:
  * $ rake db:setup
  * $ rake db:seed
  * $ rake swagger:docs

* To create a local server: $ rails s
  * This will create a server on http://localhost:3000
* Navigate to the server in a browser to utilize Swagger UI for clear API routing
* To run any testing: $ rspec   

## Routes   

![Routes](/state_parks_routes.PNG)

## Git Hub link:

https://github.com/CrankyJones/state_parks

## Database Layout:

![Database Layout](/state_parks_schema.PNG)

## Known Bugs:

* There are no known bugs at this time.

## **License**
[MIT](https://opensource.org/licenses/MIT)
Copyright (c) [2021] [Geof Rosenmund]

## **Contact Information**
Geof Rosenmund (geof.rosenmunds.email@gmail.com)