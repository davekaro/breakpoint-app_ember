# Breakpoint App (Ember.js edition)

I wanted to learn Ember, so I decided to take Breakpoint App and rewrite it in Ember

## Requirements

* Rails 4 (rails-api) with latest Ruby 2
* PostgreSQL

## Install

* `git clone`, `bundle install` to get started
* `cp config/database.yml{.example,}` and update settings
* `rake db:setup`

Two users are created for you
* dave@example.com, password
* john@example.com, secret

Create your user in Rails console
* `rails c`
* `User.create(first_name: 'Dave', last_name: 'Kroondyk', email: 'dave@example.com', time_zone: 'Eastern Time (US & Canada)', password: 'secret', password_confirmation: 'secret')`

