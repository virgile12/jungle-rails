### E-Commerce(Jungle-Rails)
Jungle is a mini e-commerce application built with Rails 4.2 based on the structure of amazon online commerce style. E-commerce features a rating system built into jungle that adjust ratings in real time and can be viewed on both the catalong page and each product detail page. Email confirmations with order details is sent to users upon purchase - the later using stripe as the payment charging system. A pdf receipt is also available for download on the completed order page.
While users do not need to be signed in to view the products catalog and respective detail pages, a user must sign in to submit a review or delete a review and admin users have an extra step of authentication to access the create product and create category pages


## Setup
* Fork & Clone
* Run bundle install to install dependencies
* Create config/database.yml by copying config/database.example.yml
* Create config/secrets.yml by copying config/secrets.example.yml
* Run bin/rake db:reset to create, load and seed db
* Create .env file based on .env.example
* Sign up for a Stripe account
* Put Stripe (test) keys into appropriate .env vars
* Run bin/rails s -b 0.0.0.0 to start the server
* Stripe Testing
* Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

* More information in their docs: https://stripe.com/docs/testing#cards

## Dependencies
* Rails 4.2 Rails Guide
* PostgreSQL 9.x
* Stripe
