Chitter Challenge [![Build Status](https://travis-ci.org/makersacademy/chitter-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/chitter-challenge)
=================

This is one of my weekend challenges while at Makers Academy. It's a twitter clone built with Sinatra. By building the project I consolidated my understanding of REST principles, SQL databases and the creation of domain models with an ORM.

Technologies
-------
- Sinatra to build the server
- Postgres database with Datamapper ORM
- Tested with Capybara and Factory Girl

Installation
-------
You need to have PostgreSQL installed, with Chitter_development and Chitter_test databases set up.
Git clone the repository and run bundle install, then run rackup to launch the server.

User Stories
-------
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

- The username and email are unique.
- Peeps (posts to chitter) have the name of the maker and their user handle.
- Use data mapper and postgres to save the data.
- You don't have to be logged in to see the peeps.
- You only can peep if you are logged in.

Still to implement
-----
- refactor modular style
- style with bootstrap or foundation
