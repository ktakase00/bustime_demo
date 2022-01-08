# bustime_demo

## 概要

Hotwire の機能を試すためのデモアプリケーションです。

## 実行

準備

```sh
cp -p .env.sample .env
```

コンテナ起動

```sh
docker-compose up -d db
docker-compose run --rm -p 3000:3000 web bash
```

Rails 起動

```sh
cd /shared/bustime
bundle config set --local path vendor/bundle
bundle install
bundle exec rails db:migrate
bundle exec rails server -b 0.0.0.0
```

Web ブラウザでアクセス

```
http://localhost:3000/bus_lines
http://localhost:3000/bus_schedules
```
