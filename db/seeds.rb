require 'date'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



Customer.create(
    company_name: "Quick Movers", 
    email: "quickmovers@gmail.com", 
    password: "quickmovers",
    is_available: true
)


Customer.create(company_name: "Carry and Load Movers", 
    email: "carryandload@gmail.com", 
    password: "carryandload",
    is_available: true
)



Vehicle.create(
    vehicle_name: "Isuzu D-Max",
    vehicle_type: "Pick-Up",
    vehicle_number: "KAT 2223",
    vehicle_color: "white",

    mover_id: 1

)

Vehicle.create(
    vehicle_name: "Scania",
    vehicle_type: "Lorry",
    vehicle_number: "KDD 2223",
    vehicle_color: "grey",

    mover_id: 2

    
)


CustomerOrder.create(
    order_date: Date.today,
    delivery_date: Date.today + 1,
    customer_id: 1,
    mover_id: 2,
    price_id: 3,
)

Admin.create(
    first_name: "Francis",
    last_name: "Maina",
    email: "francis@admin.com",
    password: "test123",
    customer_order_id: 1
)
