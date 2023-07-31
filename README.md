##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [3.0.2](https://github.com/carlosmorin/task-manager/blob/main/Gemfile#L1)
- Rails [7.0.6](https://github.com/carlosmorin/task-manager/blob/main/Gemfile#L6)

##### 1. Check out the repository

```bash
git clone git@github.com:carlosmorin/task-manager.git
```
##### 1. Run
```bash
bundle install
```

##### 2. Install MySQL

For this proyect we are use Mysql for the database managment 

```bash
sudo apt-get install mysql-server mysql-client libmysqlclient-dev
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000