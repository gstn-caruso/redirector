FROM ruby:slim

RUN mkdir /app
WORKDIR /app
ADD server.rb /app
EXPOSE 8080

CMD ["ruby", "server.rb"]
