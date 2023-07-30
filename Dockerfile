# Use the official Ruby image as the base image
FROM ruby:3.1.3 as web

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client gnupg2

# Install Yarn
RUN curl -o- -L https://yarnpkg.com/install.sh | bash

# Add Yarn to the PATH
ENV PATH /root/.yarn/bin:$PATH

# Install Rails gem
RUN gem install rails -v '7.0.0'

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the entire application to the container
COPY . .

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
