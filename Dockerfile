FROM --platform=linux/x86_64 ruby:3.1

RUN mkdir /bauikis2
WORKDIR /bauikis2
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

# Bundlerの不具合対策(1)
RUN gem update --system
RUN bundle update --bundler

RUN bundle install
COPY . /bauikis2

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

