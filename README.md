# _Hair Salon Manager_

##### _Allows a hair salon manager to manage stylists, clients, and a specific stylists' clients, August 21, 2015_

#### By _**Josue Valverde**_

## Description

_This application manages Hair Stylists and Clients with two classes (Stylist and Client) and two psql tables (stylists and clients). The Client class has a stylist_id which indicates which hair stylist they are a client of. A hair stylist can have many clients but a client cannot have more than one hairstylist. When a client is added, it can be supplied the stylist_id to which to link up to. Otherwise, the update method can be used to link a new stylist to the client. Deletion of a client simply deletes the client, but deletion of a stylist requires the stylist's clients to be linked up to a new stylist._

## Setup

* _`$ git clone` this repository into your computer_
* _`$ cd hair_salon` to enter project directory_
* _`$ bundle` to install program dependencies_
* _`$ postgres` to start a postgres server_
* _Open new terminal tab and run `$ psql`_
* _In PSQL `user=# CREATE DATABASE hair_salon;` to create a database_
* _In PSQL `user=# \c hair_salon` to connect to hair_salon databse_
* _In PSQL `hair_salon=# CREATE TABLE stylists (id serial PRIMARY KEY, name varchar, specialty varchar, rating int);` to create stylists table_
* _In PSQL `hair_salon=# CREATE TABLE clients (id serial PRIMARY KEY, stylist_id int, name varchar, rating int, hairtype varchar);` to create clients table_
* _open new tab and run `$ ruby app.rb` in the project directory to run sinatra app_
* _go to `localhost:4567` in your browser to open webapp_


## Technologies Used

* _Written in Ruby_
* _Ran test site with Sinatra_
* _Error checking with RSpec and Capybara_
* _Database management with postgresql_

### Legal

Copyright (c) 2015 **_Josue Valverde_**

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
