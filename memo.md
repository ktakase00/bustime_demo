
```sh
mkdir work
cd work
bundle init
echo "gem 'rails', '~>7.0.1'" >> Gemfile
echo "gem 'bootsnap'" >> Gemfile
echo "gem 'importmap-rails'" >> Gemfile
echo "gem 'turbo-rails'" >> Gemfile
echo "gem 'stimulus-rails'" >> Gemfile
echo "gem 'sprockets-rails'" >> Gemfile
bundle config set --local path vendor/bundle
bundle install

bundle exec rails new ../bustime -d postgresql --skip-jbuilder

cd ../bustime
bundle install
# mv ../.gitignore .
# echo "/work/*" > ../.gitignore
```

```sh
cp -p config/database.yml config/database.yml.org
sed -E -e "s/^(  )(database: bustime_development)/\1# \2\n  database: <%= ENV['PROJECT_NAME'] %>\n  username: <%= ENV['PROJECT_NAME'] %>\n  password: <%= ENV['PROJECT_NAME'] %>\n  host: db/" config/database.yml.org > config/database.yml
rm config/database.yml.org
```

```sh
bundle exec rails generate scaffold BusLine name:text
bundle exec rails generate scaffold BusSchedule departure_hour:bigint departure_minute:bigint bus_line_id:bigint
bundle exec rails db:migrate
```

```sh
bundle exec rails server -b 0.0.0.0
```

```
http://localhost:3000/bus_lines
```

```sh
bundle exec rails generate controller ListBusSchedulesController

cp -p config/routes.rb config/routes.rb.org
sed -E -e "s/^  (resources :bus_lines)/  \1\n  resources :list_bus_schedules, only: [:index]/" config/routes.rb.org > config/routes.rb
rm config/routes.rb.org
```
