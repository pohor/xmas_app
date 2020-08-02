##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby 2.6.3
- Rails 6.0.3.2
- yarn 1.22.4
- PostgreSQL 12.3

##### 1. Check out the repository

```bash
git clone git@github.com:pohor/xmas_app.git
```

##### 2. Create and setup the database (PostreSQL)

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 3. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000

##### Database

The app uses Postres for easier deploy with Heroku.

##### Gems used

The app ueses:
- [Devise](https://github.com/heartcombo/devise) to manage users
- [Letter Opener](https://github.com/ryanb/letter_opener) for managing emails in development. For production the config is set to use Sendgrid.
- [Link Thumbnailer](https://github.com/gottfrois/link_thumbnailer) for fetching images from urls
