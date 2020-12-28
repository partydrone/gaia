FROM ruby:3.0.0-rc1-buster

LABEL Name=gaia Version=0.0.1

ENV APP_DIR=/srv/gaia

RUN curl -sL https://deb.nodesource.com/setup_15.x | bash - \
  && curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq && apt-get install -y imagemagick nano nodejs postgresql-client yarn \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

##
# Install system gems

RUN gem install bundler && bundle config set system 'true'

##
# Create a cache layer for node packages

COPY package.json yarn.lock /tmp/
RUN cd /tmp && yarn

##
# Build the Rails application

WORKDIR ${APP_DIR}
RUN cp -a /tmp/node_modules .
COPY Gemfile* ./
RUN bundle install -j4

COPY . .

EXPOSE 3000

CMD ["rails", "s", "-b", "0.0.0.0"]
