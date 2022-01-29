# README
Started by following: https://docs.docker.com/samples/rails/ (with different app name, Ruby & Rails versions)
- Removed webpacker gem as was throwing error: 'Webpacker configuration file not found' on docker-compose build (let's sort this out later)
- Ran `docker-compose run web rake db:create` _before_ `docker-compose up` (unlike in guide)
- = 'yay, you're on rails' page at `localhost:3000` when run `docker-compose up` :-)

Rails 6 _really_ wants webpacker! So...
Added `yarn` to `apt-get install`, and these lines to `Dockerfile` to get yarn:
```
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
...
RUN yarn install
```
(from: https://blog.cloud66.com/deploying-rails-6-assets-with-docker/)
  
Then rebuilt image
Then ran `$ docker-compose run web rails webpacker:install`
Now, `docker-compose up` gives me a working view @ `localhost:3000/users` :-)

Evidence:  
  
<img width="479" alt="Screenshot 2022-01-24 at 20 34 34" src="https://user-images.githubusercontent.com/3944042/150860463-6a8e8e94-c452-4683-8540-5b928b6429ab.png">

To call helper method from Rails console (in `UsersHelper`, called `test`):
```
irb(main):003:0> include UsersHelper
=> Object
irb(main):004:0> helper.test
  User Load (2.7ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT $1  [["LIMIT", 1]]
Testy
=> nil
```


## Resources:
Benchmarking:  
- https://github.com/rails/rails-perftest
- https://www.claykarwisch.com/testing/2021/03/09/benchmarking-database-performance.html

---------------------------------------------------------------------------

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
