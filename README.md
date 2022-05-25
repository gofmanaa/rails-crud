# README
A simple CRUD project on Ruby on Rails with user authentication by email and password.

The project is running on version Ruby 3 and Rails 7.0.3, workability on other versions has not been tested.

## Usage:
1) Clone respected git repository
```shell
git clone https://github.com/gofmanaa/rails-crud.git
```
2) Install required dependencies
```shell
  $ bundle install
```
3) Create db and migrate schema
```shell
  $ rake db:create
  $ rake db:migrate
  $ rake db:seed
```
4) Run the following command in the project folder 
```shell
  $ rails server 
```
5) Open the link in the browser [http://127.0.0.1:3000/](http://127.0.0.1:3000/)
6) Log in as admin user with credentials:
```text
  email: admin@mail.com
  password: 1234
```
