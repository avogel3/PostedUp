# PostedUp 😎📲

### Project Stack

* **Ruby:** 2.4.0
* **Rails:** 5.0.3
* **Database:** postgresql
* **Job Queue:** Sidekiq & Redis
* **Authentication:** 
* **Image Uploads:** Carrierwave & Dropbox
* **Tests:** RSpec & Cucumber & Capybara-Webkit

### Setting Up Your Environment

### Assuming you have cloned the project and changed into it's directory:

#### Install dependencies with:

``` bash
bundle install
```

#### Create and seed the database. (Might wants to change the values in seeds.rb)

``` bash
rake db:setup
```

#### Run the app locally:

``` bash
rails server 
```


### Processing Jobs 🤺

#### Start workers/Queue with:

##### This project depends on redis-server to run in the background when processing jobs. Install it with the gem or with brew.

``` bash
brew install redis-server # optionally if you do not have redis-server on OSX
redis-server
```

##### Run the Job Queue

``` ruby
bundle exec sidekiq
```


### Social Media Posts 📟

In Production, this app automatically links posts to the [PostedUp Community Page on Facebook](https://www.facebook.com/PostedUp-App-Community-214327459084678/).


### API Requests 👾

This app is being refactored to server api requests on the /api namespace.
