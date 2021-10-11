FROM ruby:2.6.3

RUN apt-get update && apt-get install -y \
    nodejs \
    postgresql-client \
    tesseract-ocr \
    npm && \
    npm install yarn -g

RUN mkdir /app
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install
COPY . .

EXPOSE 3000
RUN chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]