# README

Blizzard is an api for managing tasks. It provides basic methods for storing and
retrieving stories. Please see the [Inferno](https://github.com/michaelrob/inferno)
repository for a front end to this api.

-------------------------------

##Installation

* ensure PostgreSQL is installed, and create a user:

  psql template1
  create role blizzard_website with createdb login password '123password';
  bundle install (install relevant gems)
  pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start (starts psql)

* rake db:setup (creates database, sets up schema migrations, etc)
* rake db:migrate (creates schema)
* rails s (start server)

-------------------------------

## Consuming the API

###users

*url:* http://localhost:3000/v1/users

####users#create
*Request:*
```
{"user": {"username": "testuser", "email": "test@test.com", "password": "12341234", "password_confirmation": "12341234"}}
```
*Response:*
```
{"email":"test@test.com","username":"testuser","token_type":"Bearer","user_id":1,"access_token":"15:bbbyXLZ3o_XpC6MxU_Bt"}
```

###login

*url:* http://localhost:3000/v1/login

####sessions#create
*Request:*
```
{"email": "test@test.com", "password": "12341234"}
```
*Response:*
```
{"email":"test@test.com","username":"testuser","token_type":"Bearer","user_id":12,"access_token":"15:bbbyXLZ3o_XpC6MxU_Bt"}

```

###stories

*url:* http://localhost:3000/v1/stories

####stories#create
*Request:*
```
header: Authorization: 15:bbbyXLZ3o_XpC6MxU_Bt
{ "story": { "title": "Test Title", "body": "This is a body, it is good" } }
```
*Response:*
```
{"story":{"title":"Test Title","body":"This is a body, it is good","created_at":"2015-08-20T19:43:07.701Z","abstract":"This is a body, it is good","id":11,"user":{"username":"testuser"}}}
```

####stories#show
notes: this is for an individual story, url: http://localhost:3000/v1/stories/11
*Request:*
```
header: Authorization: 15:bbbyXLZ3o_XpC6MxU_Bt
```
*Response:*
```
{"story":{"title":"Test Title","body":"This is a body, it is good"","created_at":"2015-08-20T19:43:07.701Z","abstract":"This is a body, it is good"","id":11,"user":{"username":"testuser"}}}
```