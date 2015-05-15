###Bahamas Clients API

----------

**Bahamas Clients API** is a simple application which was made during the job interview process at [RUPEAL team](http://www.rupeal.com/).

* Task description could be found [here](https://github.com/pearce89/bahamas/blob/master/challenge.md).
* Check [issues section](https://github.com/pearce89/bahamas/issues) for discussion after task completion.

----------

https://bahamas.herokuapp.com/

Source code: https://github.com/pearce89/bahamas.git

[![Build Status](https://circleci.com/gh/pearce89/bahamas.png?circle-token=:circle-token)](https://circleci.com/gh/pearce89/bahamas)

----------

####Install notes

1. Create a `database.yml` file with your database credentials
2. Execute `bundle install`
3. Execute `rails s`

----------

#### API Versions

Bahama Clients API has a basic version system.

Each request should have a version as an internet media type parameter.

----------

#### Request examples


##### 1. Store the Client

**url:** https://bahamas.herokuapp.com/store-bahamas-client/:invoice_id

**parameters:** *name* , *email* , *fiscal_id*

`curl -H "accept: application/json; version=1" --data "fiscal_id=9999&name=Sergei&email=test@email.com" https://bahamas.herokuapp.com/store-bahamas-client/5784`



##### 2. Retrieve the Client

**url:** https://bahamas.herokuapp.com/retrieve-bahamas-client/:invoice_id

`curl -H "accept: application/json; version=1" https://bahamas.herokuapp.com/retrieve-bahamas-client/5784`
