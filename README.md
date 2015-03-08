###Bahamas Clients API

----------

http://bahamas-203224.euw1.nitrousbox.com/

Source code: https://github.com/pearce89/bahamas.git

[![Build Status](https://semaphoreci.com/api/v1/projects/ebc9440e-3bc9-49e8-bc27-9c79e66a0c27/367574/badge.png)](https://semaphoreci.com/pearce89/bahamas)

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

**url:** http://bahamas-203224.euw1.nitrousbox.com/store-bahamas-client/:invoice_id

**parameters:** *name* , *email* , *fiscal_id*

`curl -H "accept: application/json; version=1" --data "fiscal_id=9999&name=Sergei&email=test@email.com" http://bahamas-203224.euw1.nitrousbox.com/store-bahamas-client/5784`



##### 2. Retrieve the Client

**url:** http://bahamas-203224.euw1.nitrousbox.com/retrieve-bahamas-client/:invoice_id

`curl -H "accept: application/json; version=1" http://bahamas-203224.euw1.nitrousbox.com/retrieve-bahamas-client/5784`