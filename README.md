<p align="center"><img width=20% src="https://github.com/zhuhanming/cvwo/blob/master/assets/logo.png" /></p>
<h1 align="center">Hit Your Targets</h1>
<h3 align="center">A todo list for the meticulous</h2>

# Hit Your Targets API

## Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.6.5](https://github.com/zhuhanming/hit-your-targets-api/blob/master/.ruby-version#L1)
- Rails [6.0.1](https://github.com/zhuhanming/hit-your-targets-api/blob/master/Gemfile#L7)
- Postgres

### 1. Check out the repository

```bash
git clone git@github.com:zhuhanming/hit-your-targets-api.git
```

### 2. Ensure that you have Postgres running

Install Postgres as required

### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000
