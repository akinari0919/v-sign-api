FROM ruby:3.1.0

RUN rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       vim
# create working directory
RUN mkdir /app
# working directoryをAPP_ROOTに割り当てて、以下$APP_ROOTで参照
ENV APP_ROOT /app
WORKDIR $APP_ROOT

# bundle install
ADD ./Gemfile /app/Gemfile
ADD ./Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]
