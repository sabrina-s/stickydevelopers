# README

## StickyDevelopers

This is an app for us to practice on our ruby on rails skill.
We are creating an e-commerce website selling web development stickers.
This website will contain all the following features:

### Project Timeline

**Week 1**

Registered User stories:
As a user, I can sign in using my email address
As a user, I can access browse a collection of products
As a user, I can view the details of one product

Admin stories:
As an admin, I can create a new product
As an admin, I can view a list of all products
As an admin, I can view the details of a product, and all orders that are associated with it

Visitor stories:
As a visitor, I can access browse a collection of products
As a visitor, I can view the details of one product
As a visitor, I can sign up using email to become a registered user

**Week 2**

Visitor stories:
As a visitor, I can add a product to my shopping cart
As a visitor, if I make an order from my shopping cart, I will be redirected to sign-up/sign-in page
As a visitor, I can sign up using facebook to become a registered user

Registered User stories:
As a user, I can sign in using facebook
As a user, I can add a product to my shopping cart
As a user, I can place an order from my shopping cart

Admin stories:
As an admin, I can view a list of all orders, sorted by their order status
As an admin, I can view the details of an order.
As an admin, I can change the status of an order

**Week 3**

Registered User stories:
As a user, I can use my credit card to pay for my order *
As a user, I will receive a notification via email when my order is confirmed *
As a user, I will receive a notification via email each time my order status is changed *


## Getting Started

1. Get the code base

```bash
git clone https://github.com/sabrina-s/stickydevelopers.git
```

2. Install Gem Dependencies

```bash
cd stickydevelopers
bundle install
```

3. Setup Database

```bash
rake db:create db:migrate
```

4. Start the application

```bash
# Start the web server
rails s
```

## Branch Policy

We follow the [Github Flow](https://guides.github.com/introduction/flow) when developing the application, and name our branches as follow:

- `master` is the active development branch

Local development branch naming

- `feature/<your-branch-name>`  for substantial new feature or function
- `enhance/<your-branch-name>` for minor feature or function enhancement
- `bugfix/<your-branch-name>` for bug fixes

## Testing

We use Capybara with [Rspec](https://github.com/rspec/rspec-rails) as our testing framework.
Run these regularly during development (or use guard).

```bash
# Run the specs
rspec
-or-
bundle exec guard
```

## Deployment

We deploy our application directly to heroku. Automatic deployment has been setup for our production environment as documented [here](https://devcenter.heroku.com/articles/github-integration#automatic-deploys). To manually deploy to heroku with Git, you need to:

1. Register a heroku account and request access to production app
2. Install [heroku toolbelt](https://toolbelt.heroku.com/) which is a CLI tool for creating and managing Heroku apps
3. Setup Heroku remote

```bash
# Setup heroku remote for production
git remote add heroku https://git.heroku.com/stickydevelopers.git
```

## ERD

![ERD Diagram]()
