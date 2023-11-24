FROM ruby:3.1.2

WORKDIR /usr/src/app

COPY Gemfile* ./

RUN bundle install

COPY . .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

ENV RAILS_ENV production

CMD ["rails", "server", "-b", "0.0.0.0"]
