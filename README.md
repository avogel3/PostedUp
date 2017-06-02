# PostedUp 😎📲

### Project Stack

* **Ruby:** 2.4.0
* **Rails:** 5.0.3
* **Database:** postgresql
* **Job Queue:** Sidekiq & Redis
* **Front End:** HAML & SCSS (Bootstrap-Sass)
* **Authentication:** Devise & CanCanCan
* **Image Uploads:** Carrierwave & Dropbox

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

This app serves GET requests on /posts.json and /posts/1.json
