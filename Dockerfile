FROM --platform=linux/amd64 ruby:2.6.3-slim

USER root

RUN apt-get update -qq && apt-get install -y \
    build-essential libpq-dev libxml2-dev libxslt1-dev apt-transport-https

ENV APP_USER app
ENV APP_USER_HOME /home/$APP_USER
ENV APP_HOME /home/www/kaifbreaker

RUN useradd -m -d $APP_USER_HOME $APP_USER

RUN mkdir /var/www && \
   chown -R $APP_USER:$APP_USER /var/www && \
   chown -R $APP_USER $APP_USER_HOME

WORKDIR $APP_HOME

USER $APP_USER

COPY Gemfile Gemfile.lock ./

RUN bundle check || bundle install

COPY . .

USER root

RUN chown -R $APP_USER:$APP_USER "$APP_HOME/."

USER $APP_USER

CMD bundle exec puma -C config/puma.rb
