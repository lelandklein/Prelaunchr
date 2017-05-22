Prelaunchr
==========

## Setup

Get Ruby 2.3.0 (rbenv), bundle and install:

```no-highlight
brew update && brew upgrade ruby-build && rbenv install 2.3.0
```

Clone the repo and enter the folder (commands not shown).

Install Bundler, Foreman and Mailcatcher then Bundle:

```no-highlight
gem install bundler foreman mailcatcher
bundle
```

Copy the local `database.yml` file sample and `.env.sample`:

```no-highlight
cp config/database.yml.sample config/database.yml
cp .env.sample .env
```

Update your newly created .env file with the needed configuration
DEFAULT\_MAILER\_HOST: sets the action mailer default host as seen in
config/environment/<environment>.rb. You will minimally need this in production.
SECRET\_KEY\_BASE: sets a secret key to be used by config/initializers/devise.rb

Setup your local database:

```no-highlight
bundle exec rake db:create
bundle exec rake db:migrate
```

Start local server and mail worker:

```no-highlight
foreman start -f Procfile.dev
```

View your website at the port default `http://localhost:5000/`.
View sent mails at `http://localhost:1080/`.

### To create an admin account

In Rails console, run this command. Be careful to not use the example admin user
for security reasons. Password confirmation should match password.

`AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'passwordconfirmaiton')`

You can run this locally in a Rails console for development testing.

If you are deployed to Heroku, you would run it there.

## Teardown

* Run `bundle exec rake prelaunchr:create_winner_csvs` and the app will export
CSV's in `/lib/assets` corresponding to each prize group.

## Configuration

* Set the different prize levels on the `User::REFERRAL_STEPS` constant inside
`/app/models/user.rb`
* The `config.ended` setting in `/config/application.rb` decides whether the
prelaunch campaign has ended or not (e.g. Active/Inactive). We've included this
option so you can quickly close the application and direct users to your newly
launched site.

## License


# Prelaunchr
