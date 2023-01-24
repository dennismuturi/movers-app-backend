# Phase 5  Final Project : Movers App  (BackEnd)

## Focus 🎯
Building a Movers backend that uses Active Record to access and persist data in a database, which will be used by a separate React frontend that interacts with the database via the API.

## Learning Goals 👨‍🚀

- Use Active Record to interact with a database.
- Have a minimum of Four models with a one-to-many relationship.
- Create API routes in Ruby on Rails that handles at least Four different CRUD actions for at least one of your Active Record models.
- Build a separate React frontend application that interacts with the API to perform CRUD actions.
- Use good OO design patterns. You should have separate classes for each of your models, and create instance and class methods as necessary.

## Backend Setup ✴️
- [x] cd into movers-app-backend folder and run `bundle install` from your terminal which will install all the gems 
- [x] seed the database with data using cmd  `rails db:migrate` then  `rails db:seed` or alternatively you can use `rails db:reset` to delete everything in the database and seed it with data to be fetched by an API
- [x] Finally run `rails server` to keep your backend running on `http://127.0.0.1:3000` :boom:

## Endpoints API 🛠️

✅ Your base URL API for registering a customer in SQLite: `http://localhost:3000/customers`

✅ Your base URL API for registering a mover in SQLite: `http://localhost:3000/movers`

✅ Your base URL API for signing in a Customer in SQLite: `http://localhost:3000/customerlogin`

✅ Your base URL API for signing in a Mover in SQLite: `http://localhost:3000/moverlogin`

✅ Your base URL API for registration SQLite: `http://localhost:3000/register`


## Core Deliverables 📈

As a Customer 👨‍💻, I can:

- `C`reate profile,orders 
- `R`ead movers 
- `U`pdate profile,
- `D`elete profile


As a Mover 👨‍💻, I can:

- `C`reate profile, vehicles 
- `R`ead customer orders 
- `U`pdate profile,
- `D`elete profile, orders
## Authors 🖊️

This project was contributed to by:
- [Denis Muturi](https://github.com/dennismuturi) (Scum Master) Front/ Backend Developer
- [Lewis Munyambu](https://github.com/lewiih001) Front/ Backend Developer
- [Francis Maina](https://github.com/Maina-Francis) Front/ Backend Developer
- [Maurene Chepkemoi](https://github.com/ChepkemoiMaurene) Frontend/ Backend Developer


## License 📄

The project is licensed under MIT
