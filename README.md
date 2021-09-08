# Real Time Vehicle Tracking

## Background

Using the Samsara API to retrieve all the assets owned by a fleet. Showing those vehicles on a map. Ping the Samsara API every 10 seconds, via rufus scheduler storing the data for every vehicle in a database, and updating the location of the vehicles in the map accordingly.



## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

## Installation
* Ruby version
 2.7.3

 ```
 rbenv install 2.7.3
 ```

* Ruby on Rails version
 6.1.4.1

 ```
 gem install rails
 ```

* Database
postgresql

```
brew install postgres
```

* Clone the Project
```
git clone https://github.com/Youxaf-khan/RealTImeTracking.git

bundle install
```

* Database creation

```
  rails db:create
  rails db:migrate
```
* Run app locally on 3000 port

```
rails s
```

## Gems
gem 'figaro', '~> 1.2.0'
gem 'httparty', '~> 0.18.1'
gem 'rails-jquery-autocomplete'
gem 'rufus-scheduler', '~> 3.8.0'
gem 'sidekiq', '~>6.2.2'
-
