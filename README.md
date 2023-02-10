# Store

This repository contains a very simple application to create and retrieve orders.

To start the app use `docker-compose up`
Once started you can:
* Create a new order with `curl localhost:8080/create`. This returns the order id
* Fetch an order with `curl localhost:8080/order/YOUR_ORDER_ID`

Some facts about the application:
* It uses redis to store the orders as a json serialization.
* It is written in Golang.
* It is docker-compose to start the full stack (web server & redis)
* Follows a very weak hexagonal & DDD approach.

What this app doesnt have:
* Any tests
* Any logging funcitonality
* Any monitoring/metrics
# playground
